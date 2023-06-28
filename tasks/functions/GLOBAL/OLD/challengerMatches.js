const { RiotAPI, RiotAPITypes, PlatformId } = require("@fightmegg/riot-api");
const db = require("../../../db");

module.exports = async function challengerMatchesData(
  array,
  chunkSize,
  region,
  startTime
) {
  const rAPI = await new RiotAPI(process.env.RIOT_API_KEY);
  //Delay between api calls in milliseconds
  var delay = 3000;
  var remaining = array.length;
  //Empty array for adding new promises
  var promises = [];
  //Pushing new promises (Array.prototype.push.apply) to the existing ones with each part of api calls
  var addPromises = (newPromises) => {
    Array.prototype.push.apply(promises, newPromises);
    if (remaining === promises.length) {
      function sleep(milliseconds) {
        const date = Date.now();
        let currentDate = null;
        //date to stala wartosc, powiedzmy, ze obydwie wartosci startuja od 0, currentDate tez startuje od 0, ale zwieksza sie o 1 z kazda milisekunda, bo leci w petli w czasie rzeczywistym, wiec jak dojdzie do 2001, to 2001-0 < 2000 złamie loop i z niego wyjdzie
        do {
          currentDate = Date.now();
        } while (currentDate - date < milliseconds);
      }

      //wait X milliseconds between the previous calls
      sleep(10000);

      Promise.all(promises).then((promisesData) => {
        var matchesArray = [];

        //take all the matches (resolvedPromises) and push unique values into the array
        promisesData.map((promise) => {
          promise.map((nestedPromise) => {
            if (!matchesArray.includes(nestedPromise)) {
              matchesArray.push(nestedPromise);
            }
          });
        });

        try {
          function rateLimitedRequestsMatches(array, chunkSize, region) {
            var delay = 3000;
            var remaining = array.length;
            var promises = [];
            var addPromises = function (newPromises) {
              Array.prototype.push.apply(promises, newPromises);
              if (remaining === promises.length) {
                Promise.all(promises).then((data) => {
                  const matchQueries = data.map(async (matchData) => {
                    try {
                      await db.query(
                        "INSERT INTO matches (data_version, match_id, game_datetime, game_length, game_version, queue_id, tft_game_type, tft_set_core_name, tft_set_number, matchRegion, fetched_at, matchRanking) values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12) ON CONFLICT DO NOTHING RETURNING *",
                        [
                          matchData.metadata.data_version,
                          matchData.metadata.match_id,
                          matchData.info.game_datetime,
                          matchData.info.game_length,
                          matchData.info.game_version,
                          matchData.info.queue_id,
                          matchData.info.tft_game_type,
                          matchData.info.tft_set_core_name,
                          matchData.info.tft_set_number,
                          region,
                          new Date(),
                          "CHALLENGER",
                        ]
                      );

                      matchData.info.participants.map(async (participant) => {
                        try {
                          await db.query(
                            "INSERT INTO match_participant (match_id, gold_left, last_round, participant_level, placement, players_eliminated, time_eliminated, puuid, total_damage_to_players) values ($1, $2, $3, $4, $5, $6, $7, $8, $9) ON CONFLICT DO NOTHING",
                            [
                              matchData.metadata.match_id,
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
                                matchData.metadata.match_id,
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
                                matchData.metadata.match_id,
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
                                matchData.metadata.match_id,
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
                                  matchData.metadata.match_id,
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
                    } catch (err) {
                      console.log(err);
                    }
                  });
                });

                console.log(region, "done");
              }
            };
            (function requestMatchList() {
              addPromises(
                //this whole part are newPromises, function is splicing the whole array of matches by chunkSize witch each portion of api calls matches array is empty
                array.splice(0, chunkSize).map(async (matchId) => {
                  try {
                    return await rAPI.tftMatch.getById({
                      region,
                      matchId,
                    });
                  } catch (err) {
                    console.log(err);
                  }
                })
              );
              if (array.length) {
                setTimeout(requestMatchList, delay);
              }
            })();
          }

          rateLimitedRequestsMatches(matchesArray, 3, region);
        } catch (err) {
          console.log(err);
        }
      });
    }
  };
  //function responsible for making Promises by making api calls in chunks
  (function request() {
    addPromises(
      //these are new promises
      //lets assume there are 10 puuids, cut first 3 and make api calls, which will create 3 Promises
      array.splice(0, chunkSize).map(async (puuid) => {
        try {
          return await rAPI.tftMatch.getMatchIdsByPUUID({
            puuid,
            region,
            params: {
              startTime,
            },
          });
        } catch (err) {
          console.log(err);
          return null;
        }
      })
    );
    if (array.length) {
      setTimeout(request, delay);
    }
  })();
};
