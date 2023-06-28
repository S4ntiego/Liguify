const { RiotAPI, RiotAPITypes, PlatformId } = require("@fightmegg/riot-api");
const db = require("../../../db");
const delay = require("../../Additional/delay");

module.exports = fetchMastersMatches = async (
  arrays,
  region,
  chunkSize,
  delayTime,
  startTime
) => {
  const rAPI = await new RiotAPI(process.env.RIOT_API_KEY);
  for (let array of arrays) {
    var matchList = await rAPI.tftMatch.getMatchIdsByPUUID({
      region,
      puuid: array,
      params: {
        startTime,
        count: 500,
      },
    });

    const request = async () => {
      console.log("initial", matchList.length);
      matchList.splice(0, chunkSize).map(async (matchId, i) => {
        try {
          const match = await rAPI.tftMatch.getById({
            region,
            matchId,
          });
          await db.query(
            "INSERT INTO matches (data_version, match_id, game_datetime, game_length, game_version, queue_id, tft_game_type, tft_set_core_name, tft_set_number, matchRegion, fetched_at, matchRanking) values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12) ON CONFLICT DO NOTHING RETURNING *",
            [
              match.metadata.data_version,
              match.metadata.match_id,
              match.info.game_datetime,
              match.info.game_length,
              match.info.game_version,
              match.info.queue_id,
              match.info.tft_game_type,
              match.info.tft_set_core_name,
              match.info.tft_set_number,
              region,
              new Date(),
              "MASTER",
            ]
          );
          match.info.participants.map(async (participant) => {
            try {
              await db.query(
                "INSERT INTO match_participant (match_id, gold_left, last_round, participant_level, placement, players_eliminated, time_eliminated, puuid, total_damage_to_players) values ($1, $2, $3, $4, $5, $6, $7, $8, $9) ON CONFLICT DO NOTHING",
                [
                  match.metadata.match_id,
                  participant.gold_left,
                  participant.last_round,
                  participant.level,
                  participant.placement,
                  participant.players_eliminated,
                  participant.time_eliminated,
                  participant.puuid,
                  participant.total_damage_to_players,
                ]
              );
            } catch (err) {
              console.log(err);
            }
            participant.traits.map(async (trait, i) => {
              try {
                await db.query(
                  "INSERT INTO match_participant_trait (match_id, puuid, trait_name, num_units, style, tier_current, tier_total) values ($1, $2, $3, $4, $5, $6, $7) ON CONFLICT DO NOTHING",
                  [
                    match.metadata.match_id,
                    participant.puuid,
                    trait.name.slice(5),
                    trait.num_units,
                    trait.style,
                    trait.tier_current,
                    trait.tier_total,
                  ]
                );
              } catch (err) {
                console.log(err);
              }
            });
            participant.augments.map(async (augment, i) => {
              try {
                await db.query(
                  "INSERT INTO match_participant_augment (match_id, puuid, augment_api_name, stage) values ($1, $2, $3, $4) ON CONFLICT DO NOTHING",
                  [
                    match.metadata.match_id,
                    participant.puuid,
                    augment.slice(13),
                    i,
                  ]
                );
              } catch (err) {
                console.log(err);
              }
            });
            participant.units.map(async (unit, i) => {
              try {
                await db.query(
                  "INSERT INTO match_participant_champion (match_id, puuid, champion_api_name, rarity, tier) values ($1, $2, $3, $4, $5) ON CONFLICT DO NOTHING",
                  [
                    match.metadata.match_id,
                    participant.puuid,
                    unit.character_id.slice(5),
                    unit.rarity,
                    unit.tier,
                  ]
                );
              } catch (err) {
                console.log(err);
              }
              unit.items.map(async (item, i) => {
                try {
                  await db.query(
                    "INSERT INTO match_participant_champion_item (match_id, puuid, champion_api_name, item_id) values ($1, $2, $3, $4) ON CONFLICT DO NOTHING",
                    [
                      match.metadata.match_id,
                      participant.puuid,
                      unit.character_id.slice(5),
                      item,
                    ]
                  );
                } catch (err) {
                  console.log(err);
                }
              });
            });
          });
          console.log(match.metadata.match_id, "added");
        } catch (err) {
          console.log(err);
        }
      });

      console.log("final", matchList.length);

      if (matchList.length) {
        //delay between calls in one player loop
        await delay(delayTime);
        request();
      }
    };
    if (matchList.length) {
      request();
      //delay between all the players loop
      await delay(delayTime);
    }
  }
};
