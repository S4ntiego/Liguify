require("dotenv").config();
// require("./tasks/tasks")();
const cors = require("cors");
const morgan = require("morgan");
const express = require("express");
const db = require("./db");
const { RiotAPI, RiotAPITypes, PlatformId } = require("@fightmegg/riot-api");
const Redis = require("ioredis");

const fetchChallengerPlayersLeague = require("./functions/GLOBAL/Challenger/fetchChallengerPlayersLeague");
const fetchChallengerPlayers = require("./functions/GLOBAL/Challenger/fetchChallengerPlayers");
const fetchChallengerMatchesIds = require("./functions/GLOBAL/Challenger/fetchChallengerMatchesIds");
const fetchChallengerPlayersDetails = require("./functions/GLOBAL/Challenger/fetchChallengerPlayersDetails");
const fetchChallengerMatchesDetails = require("./functions/GLOBAL/Challenger/fetchChallengerMatchesDetails");

const fetchGrandmasterPlayersLeague = require("./functions/GLOBAL/Grandmaster/fetchGrandmasterPlayersLeague");
const fetchGrandmasterPlayers = require("./functions/GLOBAL/Grandmaster/fetchGrandmasterPlayers");
const fetchGrandmasterMatchesIds = require("./functions/GLOBAL/Grandmaster/fetchGrandmasterMatchesIds");
const fetchGrandmasterPlayersDetails = require("./functions/GLOBAL/Grandmaster/fetchGrandmasterPlayersDetails");
const fetchGrandmasterMatchesDetails = require("./functions/GLOBAL/Grandmaster/fetchGrandmasterMatchesDetails");

const fetchMasterPlayersLeague = require("./functions/GLOBAL/Master/fetchMasterPlayersLeague");
const fetchMasterPlayers = require("./functions/GLOBAL/Master/fetchMasterPlayers");
const fetchMasterMatchesIds = require("./functions/GLOBAL/Master/fetchMasterMatchesIds");
const fetchMasterPlayersDetails = require("./functions/GLOBAL/Master/fetchMasterPlayersDetails");
const fetchMasterMatchesDetails = require("./functions/GLOBAL/Master/fetchMasterMatchesDetails");

const app = express();
const port = process.env.PORT || 3001;

app.use(morgan("dev"));

app.use(cors());
app.use(express.json());

const redis = new Redis();

//CHALLENGER

app.get("/challenger/eune", async (req, res) => {
  const euneChallengers = await fetchChallengerPlayers("EUN1");
  fetchChallengerPlayersDetails(euneChallengers, "EUN1", 10, 12000);
});

app.get("/challenger/na", async (req, res) => {
  const naChallengers = await fetchChallengerPlayers("NA1");
  fetchChallengerPlayersDetails(naChallengers, "NA1", 10, 12000);
});

app.get("/challenger/kr", async (req, res) => {
  const krChallengers = await fetchChallengerPlayers("KR");
  fetchChallengerPlayersDetails(krChallengers, "KR", 10, 12000);
});

app.get("/challenger/euw", async (req, res) => {
  const euwChallengers = await fetchChallengerPlayers("EUW1");
  fetchChallengerPlayersDetails(euwChallengers, "EUW1", 10, 12000);
});

app.get("/challenger/br", async (req, res) => {
  const brChallengers = await fetchChallengerPlayers("BR1");
  fetchChallengerPlayersDetails(brChallengers, "BR1", 10, 12000);
});

app.get("/challengerLeague", async (req, res) => {
  const euneChallengersLeague = fetchChallengerPlayersLeague("EUN1");
  const naChallengersLeague = fetchChallengerPlayersLeague("NA1");
  const krChallengersLeague = fetchChallengerPlayersLeague("KR");
  const euwChallengersLeague = fetchChallengerPlayersLeague("EUW1");
  const brChallengersLeague = fetchChallengerPlayersLeague("BR1");
  const trChallengersLeague = fetchChallengerPlayersLeague("TR1");
  const lasChallengersLeague = fetchChallengerPlayersLeague("LA2");
  const lanChallengersLeague = fetchChallengerPlayersLeague("LA1");
  const oceChallengersLeague = fetchChallengerPlayersLeague("OC1");
  const jpChallengersLeague = fetchChallengerPlayersLeague("JP1");

  const [
    euneResult,
    naResult,
    krResult,
    euwResult,
    brResult,
    trResult,
    lanResult,
    lasResult,
    oceResult,
    jpResult,
  ] = await Promise.all([
    euneChallengersLeague,
    naChallengersLeague,
    krChallengersLeague,
    euwChallengersLeague,
    brChallengersLeague,
    trChallengersLeague,
    lasChallengersLeague,
    lanChallengersLeague,
    oceChallengersLeague,
    jpChallengersLeague,
  ]);
});

app.get("/challengerLeague/eune", async (req, res) => {
  const euneChallengersLeague = await fetchChallengerPlayersLeague(
    "EUN1",
    req,
    res
  );
});

app.get("/challengerLeague/na", async (req, res) => {
  const naChallengersLeague = await fetchChallengerPlayersLeague(
    "NA1",
    req,
    res
  );
});

app.get("/challengerLeague/kr", async (req, res) => {
  const krChallengersLeague = await fetchChallengerPlayersLeague(
    "KR",
    req,
    res
  );
});

app.get("/challengerLeague/euw", async (req, res) => {
  const euwChallengersLeague = await fetchChallengerPlayersLeague(
    "EUW1",
    req,
    res
  );
});

app.get("/challengerLeague/br", async (req, res) => {
  const brChallengersLeague = await fetchChallengerPlayersLeague(
    "BR1",
    req,
    res
  );
});

app.get("/challengerMatches/", async (req, res) => {
  const regions1 = ["EUROPE", "KR", "ASIA"];

  const europeChallengerPlayers = await db.query(
    "SELECT summoners.puuid FROM summoners LEFT JOIN summonersLeague ON summoners.summonerId = summonersLeague.summonerId WHERE summonerRegion='EUW1' OR summonerRegion='EUN1' AND tier='CHALLENGER'"
  );

  const asiaChallengerPlayers = await db.query(
    "SELECT summoners.puuid FROM summoners LEFT JOIN summonersLeague ON summoners.summonerId = summonersLeague.summonerId WHERE summonerRegion='KR' AND tier='CHALLENGER'"
  );

  const americaChallengerPlayers = await db.query(
    "SELECT summoners.puuid FROM summoners LEFT JOIN summonersLeague ON summoners.summonerId = summonersLeague.summonerId WHERE summonerRegion='NA1' AND tier='CHALLENGER'"
  );

  const europeChallengerPuuids = europeChallengerPlayers.rows.map(
    (row) => row.puuid
  );
  const asiaChallengerPuuids = asiaChallengerPlayers.rows.map(
    (row) => row.puuid
  );
  const americaChallengerPuuids = americaChallengerPlayers.rows.map(
    (row) => row.puuid
  );

  const europeChallengersMatches = fetchChallengerMatchesDetails(
    europeChallengerPuuids,
    "EUROPE",
    10,
    13000,
    1659412800
  );

  const asiaChallengersMatches = fetchChallengerMatchesDetails(
    asiaChallengerPuuids,
    "ASIA",
    10,
    13000,
    1659412800
  );

  const americaChallengersMatches = fetchChallengerMatchesDetails(
    americaChallengerPuuids,
    "AMERICAS",
    10,
    13000,
    1659412800
  );

  const [
    europeChallengerMatchesResult,
    asiaChallengerMatchesResult,
    americaChallengerMatchesResult,
  ] = await Promise.all([
    europeChallengersMatches,
    asiaChallengersMatches,
    americaChallengersMatches,
  ]);

  regions1.map(async (region) => {
    try {
      const timestamps = await db.query(
        "INSERT INTO fetchTimestamp (fetched_at, matchRegion, matchRanking) values ($1, $2, $3)",
        [new Date(), region, "CHALLENGER"]
      );
    } catch (err) {
      console.log(err);
    }
  });
});

//GRANDMASTER

app.get("/grandmaster/eune", async (req, res) => {
  const euneGrandmasters = await fetchGrandmasterPlayers("EUN1");
  const euneGrandmasterDetails = await fetchGrandmasterPlayersDetails(
    euneGrandmasters,
    3,
    "EUN1",
    req,
    res
  );
});

app.get("/grandmaster/na", async (req, res) => {
  const naGrandmasters = await fetchGrandmasterPlayers("NA1");
  const naGrandmasterDetails = await fetchGrandmasterPlayersDetails(
    naGrandmasters,
    3,
    "NA1",
    req,
    res
  );
});

app.get("/grandmaster/kr", async (req, res) => {
  const krGrandmasters = await fetchGrandmasterPlayers("KR");
  const krGrandmasterDetails = await fetchGrandmasterPlayersDetails(
    krGrandmasters,
    3,
    "KR",
    req,
    res
  );
});

app.get("/grandmaster/euw", async (req, res) => {
  const euwGrandmasters = await fetchGrandmasterPlayers("EUW1");
  const euwGrandmasterDetails = await fetchGrandmasterPlayersDetails(
    euwGrandmasters,
    3,
    "EUW1",
    req,
    res
  );
});

app.get("/grandmaster/br", async (req, res) => {
  const brGrandmasters = await fetchGrandmasterPlayers("BR1");
  const brGrandmasterDetails = await fetchGrandmasterPlayersDetails(
    brGrandmasters,
    3,
    "BR1",
    req,
    res
  );
});

app.get("/grandmasterLeague", async (req, res) => {
  const euneGrandmastersLeague = fetchGrandmasterPlayersLeague("EUN1");
  const naGrandmastersLeague = fetchGrandmasterPlayersLeague("NA1");
  const krGrandmastersLeague = fetchGrandmasterPlayersLeague("KR");
  const euwGrandmastersLeague = fetchGrandmasterPlayersLeague("EUW1");
  const brGrandmastersLeague = fetchGrandmasterPlayersLeague("BR1");
  const trGrandmastersLeague = fetchGrandmasterPlayersLeague("TR1");
  const lasGrandmastersLeague = fetchGrandmasterPlayersLeague("LA2");
  const lanGrandmastersLeague = fetchGrandmasterPlayersLeague("LA1");
  const oceGrandmastersLeague = fetchGrandmasterPlayersLeague("OC1");
  const jpGrandmastersLeague = fetchGrandmasterPlayersLeague("JP1");

  const [
    euneGrandmasterResult,
    naGrandmasterResult,
    krGrandmasterResult,
    euwGrandmasterResult,
    brGrandmasterResult,
    trGrandmasterResult,
    lasGrandmasterResult,
    lanGrandmasterResult,
    oceGrandmasterResult,
    jpGrandmasterResult,
  ] = await Promise.all([
    euneGrandmastersLeague,
    naGrandmastersLeague,
    krGrandmastersLeague,
    euwGrandmastersLeague,
    brGrandmastersLeague,
    trGrandmastersLeague,
    lasGrandmastersLeague,
    lanGrandmastersLeague,
    oceGrandmastersLeague,
    jpGrandmastersLeague,
  ]);
});

app.get("/grandmasterMatches/", async (req, res) => {
  const regions2 = ["EUROPE", "ASIA", "AMERICAS"];

  const europeGrandmasterPlayers = await db.query(
    "SELECT summoners.puuid FROM summoners LEFT JOIN summonersLeague ON summoners.summonerId = summonersLeague.summonerId WHERE summonerRegion='EUW1' OR summonerRegion='EUN1' AND tier='GRANDMASTER'"
  );

  const asiaGrandmasterPlayers = await db.query(
    "SELECT summoners.puuid FROM summoners LEFT JOIN summonersLeague ON summoners.summonerId = summonersLeague.summonerId WHERE summonerRegion='KR' AND tier='GRANDMASTER'"
  );

  const americaGrandmasterPlayers = await db.query(
    "SELECT summoners.puuid FROM summoners LEFT JOIN summonersLeague ON summoners.summonerId = summonersLeague.summonerId WHERE summonerRegion='NA1' AND tier='GRANDMASTER'"
  );

  const europeGrandmasterPuuids = europeGrandmasterPlayers.rows.map(
    (row) => row.puuid
  );
  const asiaGrandmasterPuuids = asiaGrandmasterPlayers.rows.map(
    (row) => row.puuid
  );
  const americaGrandmasterPuuids = americaGrandmasterPlayers.rows.map(
    (row) => row.puuid
  );

  const europeGrandmasterMatches = fetchGrandmasterMatchesDetails(
    europeGrandmasterPuuids,
    3,
    "EUROPE",
    1658880000
  );

  const asiaGrandmasterMatches = fetchGrandmasterMatchesDetails(
    asiaGrandmasterPuuids,
    3,
    "ASIA",
    1658854800
  );

  const americaGrandmasterMatches = fetchGrandmasterMatchesDetails(
    americaGrandmasterPuuids,
    3,
    "AMERICAS",
    1658901600
  );

  const [
    europeGrandmasterMatchesResult,
    asiaGrandmasterMatchesResult,
    americaGrandmasterMatchesResult,
  ] = await Promise.all([
    europeGrandmasterMatches,
    asiaGrandmasterMatches,
    americaGrandmasterMatches,
  ]);

  regions2.map(async (region) => {
    try {
      const timestamps = await db.query(
        "INSERT INTO fetchTimestamp (fetched_at, matchRegion, matchRanking) values ($1, $2, $3)",
        [new Date(), region, "GRANDMASTER"]
      );
    } catch (err) {
      console.log(err);
    }
  });
});

// MASTER

app.get("/master/eune", async (req, res) => {
  const euneMasters = await fetchMasterPlayers("EUN1");
  fetchMasterPlayersDetails(euneMasters, "EUN1", 10, 12000);
});

app.get("/master/na", async (req, res) => {
  const naMasters = await fetchMasterPlayers("NA1");
  fetchMasterPlayersDetails(naMasters, "NA1", 10, 12000);
});

app.get("/master/kr", async (req, res) => {
  const krMasters = await fetchMasterPlayers("KR");
  fetchMasterPlayersDetails(krMasters, "KR", 10, 12000);
});

app.get("/master/euw", async (req, res) => {
  const euwMasters = await fetchMasterPlayers("EUW1");
  fetchMasterPlayersDetails(euwMasters, "EUW1", 10, 12000);
});

app.get("/master/br", async (req, res) => {
  const brMasters = await fetchMasterPlayers("BR1");
  fetchMasterPlayersDetails(brMasters, "BR1", 10, 12000);
});

app.get("/masterLeague", async (req, res) => {
  const euneMastersLeague = fetchMasterPlayersLeague("EUN1");
  const naMastersLeague = fetchMasterPlayersLeague("NA1");
  const krMastersLeague = fetchMasterPlayersLeague("KR");
  const euwMastersLeague = fetchMasterPlayersLeague("EUW1");
  const brMastersLeague = fetchMasterPlayersLeague("BR1");
  const trMastersLeague = fetchMasterPlayersLeague("TR1");
  const lasMastersLeague = fetchMasterPlayersLeague("LA2");
  const lanMastersLeague = fetchMasterPlayersLeague("LA1");
  const oceMastersLeague = fetchMasterPlayersLeague("OC1");
  const jpMastersLeague = fetchMasterPlayersLeague("JP1");

  const [
    euneMasterResult,
    naMasterResult,
    krMasterResult,
    euwMasterResult,
    brMasterResult,
    trMasterResult,
    lasMasterResult,
    lanMasterResult,
    oceMasterResult,
    jpMasterResult,
  ] = await Promise.all([
    euneMastersLeague,
    naMastersLeague,
    krMastersLeague,
    euwMastersLeague,
    brMastersLeague,
    trMastersLeague,
    lasMastersLeague,
    lanMastersLeague,
    oceMastersLeague,
    jpMastersLeague,
  ]);
});

app.get("/masterMatches/", async (req, res) => {
  const regions3 = ["EUROPE", "KR", "ASIA"];

  const europeMasterPlayers = await db.query(
    "SELECT summoners.puuid FROM summoners LEFT JOIN summonersLeague ON summoners.summonerId = summonersLeague.summonerId WHERE summonerRegion='EUW1' OR summonerRegion='EUN1' AND tier='MASTER'"
  );

  const asiaMasterPlayers = await db.query(
    "SELECT summoners.puuid FROM summoners LEFT JOIN summonersLeague ON summoners.summonerId = summonersLeague.summonerId WHERE summonerRegion='KR' AND tier='MASTER'"
  );

  const americaMasterPlayers = await db.query(
    "SELECT summoners.puuid FROM summoners LEFT JOIN summonersLeague ON summoners.summonerId = summonersLeague.summonerId WHERE summonerRegion='NA1' AND tier='MASTER'"
  );

  const europeMasterPuuids = europeMasterPlayers.rows.map((row) => row.puuid);
  const asiaMasterPuuids = asiaMasterPlayers.rows.map((row) => row.puuid);
  const americaMasterPuuids = americaMasterPlayers.rows.map((row) => row.puuid);

  const europeMastersMatches = fetchMastersMatchesDetails(
    europeMasterPuuids,
    "EUROPE",
    10,
    12000,
    1659412800
  );

  const asiaMastersMatches = fetchMastersMatchesDetails(
    asiaMasterPuuids,
    "ASIA",
    10,
    12000,
    1659412800
  );

  const americaMastersMatches = fetchMastersMatchesDetails(
    americaMasterPuuids,
    "AMERICAS",
    10,
    12000,
    1659412800
  );

  // const [
  //   europeMasterMatchesResult,
  //   asiaMasterMatchesResult,
  //   americaMasterMatchesResult,
  // ] = await Promise.all([
  //   europeMasterMatches,
  //   asiaMasterMatches,
  //   americaMasterMatches,
  // ]);

  regions3.map(async (region) => {
    try {
      const timestamps = await db.query(
        "INSERT INTO fetchTimestamp (fetched_at, matchRegion, matchRanking) values ($1, $2, $3)",
        [new Date(), region, "MASTER"]
      );
    } catch (err) {
      console.log(err);
    }
  });
});

app.post("/lol/", async (req, res) => {
  const rAPI = await new RiotAPI(process.env.RIOT_API_KEY);

  const summoner = await rAPI.tftSummoner.getBySummonerName({
    region: req.body.region,
    summonerName: req.body.summonerName,
  });

  const summonerLeague = await rAPI.tftLeague.getEntriesBySummonerId({
    region: req.body.region,
    summonerId: summoner.id,
  });

  const matchList = await rAPI.tftMatch.getMatchIdsByPUUID({
    region: "europe",
    puuid: summoner.puuid,
    params: {
      count: 2,
    },
  });

  const matches = matchList.map((m) =>
    rAPI.tftMatch.getById({
      region: "europe",
      matchId: m,
    })
  );

  const matchData = await Promise.all(matches);

  let pData = [];

  const playerData = matchData.forEach((match) => {
    const data = match.info.participants.find(
      (p) => p.puuid === summoner.puuid
    );

    pData = [...pData, data];
  });

  try {
    const searchedSummonerQuery = await db.query(
      "INSERT INTO summoners (puuid, accountId, summonerName, profileIconId, summonerId, revisionDate, summonerLevel, summonerRegion, fetched_at) values ($1, $2, $3, $4, $5, $6, $7, $8, $9) ON CONFLICT (puuid) DO UPDATE SET summonerName = $3, profileIconId = $4, revisionDate = $6, summonerLevel = $7, summonerRegion = $8, fetched_at = $9",
      [
        summoner.puuid,
        summoner.accountId,
        summoner.name,
        summoner.profileIconId,
        summoner.id,
        summoner.revisionDate,
        summoner.summonerLevel,
        req.body.region.toUpperCase(),
        new Date(),
      ]
    );
  } catch (err) {
    console.log(err);
  }

  summonerLeague.map(async (eachSummonerLeague, i) => {
    try {
      const LeagueQuery = await db.query(
        "INSERT INTO summonersLeague (summonerId, summonerName, leaguePoints, summonerRank, wins, losses, veteran, inactive, freshBlood, hotStreak, leagueId, queueType, tier) values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) ON CONFLICT DO NOTHING",
        [
          summoner.id,
          eachSummonerLeague.summonerName,
          eachSummonerLeague.leaguePoints,
          eachSummonerLeague.rank,
          eachSummonerLeague.wins,
          eachSummonerLeague.losses,
          eachSummonerLeague.veteran,
          eachSummonerLeague.inactive,
          eachSummonerLeague.freshBlood,
          eachSummonerLeague.hotStreak,
          eachSummonerLeague.leagueId,
          eachSummonerLeague.queueType,
          eachSummonerLeague.tier,
        ]
      );
    } catch (err) {
      console.log(err);
    }
  });

  matchData.map(async (match, i) => {
    try {
      const matchIdQuery = await db.query(
        "INSERT INTO matches (data_version, match_id, game_datetime, game_length, game_version, queue_id, tft_game_type, tft_set_core_name, tft_set_number, fetched_at, matchRegion, matchRanking) values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12) ON CONFLICT DO NOTHING RETURNING *",
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
          new Date(),
          req.body.region.toUpperCase(),
          summonerLeague[0].tier,
        ]
      );
    } catch (err) {
      console.log(err);
    }

    const championsArray = await Promise.all(
      match.info.participants.map(async (participant, i) => {
        try {
          const puuidQuery = await db.query(
            "INSERT INTO summoners (puuid) values ($1) ON CONFLICT DO NOTHING RETURNING id",
            [participant.puuid]
          );
        } catch (err) {
          console.log(err);
        }

        try {
          const matchQuery = await db.query(
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
            const traitsQuery = await db.query(
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

        participant.units.map(async (unit, i) => {
          try {
            const unitsQuery = await db.query(
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
              const itemQuery = await db.query(
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
      })
    );

    const augmentsArray = await Promise.all(
      match.info.participants.map(async (participant, i) => {
        participant.augments.map(async (augment, i) => {
          try {
            const augmentQuery = await db.query(
              "INSERT INTO match_participant_augment (match_id, puuid, augment_api_name, stage) values ($1, $2, $3, $4) ON CONFLICT DO NOTHING",
              [match.metadata.match_id, participant.puuid, augment.slice(13), i]
            );
          } catch (err) {
            console.log(err);
          }
        });
      })
    );
  });

  res
    .status(200)
    .json({ playerData: pData, matchData, summoner, summonerLeague });
});

//get all restaurants
app.get("/api/v1/restaurants", async (req, res) => {
  try {
    // const results = await db.query("SELECT * FROM restaurants ORDER BY name");
    const restaurantsRatingData = await db.query(
      "SELECT * FROM restaurants LEFT JOIN (SELECT restaurant_id, COUNT(*), TRUNC(AVG(rating), 1) AS average_rating FROM reviews GROUP BY restaurant_id) reviews ON restaurants.id = reviews.restaurant_id"
    );
    res.status(200).json({
      status: "success",
      results: restaurantsRatingData.rows.length,
      data: {
        restaurants: restaurantsRatingData.rows,
      },
    });
  } catch (err) {
    res.status(500).send(console.log(err));
  }
});

app.get("/api/v1/origins", async (req, res) => {
  try {
    const origins = await db.query(
      "SELECT component, item FROM components INNER JOIN items on items.item_id = components.item_id"
    );
    res.status(200).json({
      status: "success",
      results: origins.rows.length,
      data: {
        origins: origins.rows,
      },
    });
  } catch (err) {
    res.status(500).send(console.log(err));
  }
});

app.get("/api/v1/champions", async (req, res) => {
  try {
    const champions = await db.query(
      "SELECT fr.champion_api_name, champions.champion_name, fr.frequency, ROUND(fr.average_placement, 2) as average_placement, ROUND((wfr.winfrequency/fr.frequency::decimal)*100, 2) as win_ratio, ROUND((fr.frequency::decimal/(SELECT COUNT(champion_api_name)/8 FROM match_participant_champion))*100, 2) as percentage_frequency FROM (SELECT champion_api_name, COUNT(placement) as frequency, AVG(placement) as average_placement FROM match_participant INNER JOIN match_participant_champion USING(match_id, puuid) GROUP BY champion_api_name) as fr  JOIN (SELECT champion_api_name, COUNT(placement) as winfrequency FROM match_participant INNER JOIN match_participant_champion USING(match_id, puuid) GROUP BY champion_api_name, placement HAVING placement=1) as wfr USING(champion_api_name) JOIN champions USING (champion_api_name) WHERE champion_name != 'Nomsy' GROUP BY fr.champion_api_name, champion_name, frequency, average_placement, winfrequency ORDER BY fr.average_placement"
    );

    res.status(200).json({
      status: "success",
      data: {
        champions: champions.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/leaderboard/global", async (req, res) => {
  try {
    const leaderboard = await db.query(
      "SELECT summonerName, summonerRegion, leaguePoints, wins, losses, tier, hotstreak FROM summonersLeague ORDER BY leaguePoints DESC LIMIT 1000"
    );

    res.status(200).json({
      status: "success",
      data: {
        leaderboard: leaderboard.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/leaderboard/eune", async (req, res) => {
  try {
    const leaderboard = await db.query(
      "SELECT summonerName, summonerRegion, leaguePoints, wins, losses, tier, hotstreak FROM summonersLeague WHERE summonerRegion='EUN1' ORDER BY leaguePoints DESC LIMIT 1000"
    );

    res.status(200).json({
      status: "success",
      data: {
        leaderboard: leaderboard.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/leaderboard/jp", async (req, res) => {
  try {
    const leaderboard = await db.query(
      "SELECT summonerName, summonerRegion, leaguePoints, wins, losses, tier, hotstreak FROM summonersLeague WHERE summonerRegion='JP1' ORDER BY leaguePoints DESC LIMIT 1000"
    );

    res.status(200).json({
      status: "success",
      data: {
        leaderboard: leaderboard.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/leaderboard/lan", async (req, res) => {
  try {
    const leaderboard = await db.query(
      "SELECT summonerName, summonerRegion, leaguePoints, wins, losses, tier, hotstreak FROM summonersLeague WHERE summonerRegion='LA1' ORDER BY leaguePoints DESC LIMIT 1000"
    );

    res.status(200).json({
      status: "success",
      data: {
        leaderboard: leaderboard.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/leaderboard/las", async (req, res) => {
  try {
    const leaderboard = await db.query(
      "SELECT summonerName, summonerRegion, leaguePoints, wins, losses, tier, hotstreak FROM summonersLeague WHERE summonerRegion='LA2' ORDER BY leaguePoints DESC LIMIT 1000"
    );

    res.status(200).json({
      status: "success",
      data: {
        leaderboard: leaderboard.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/leaderboard/oce", async (req, res) => {
  try {
    const leaderboard = await db.query(
      "SELECT summonerName, summonerRegion, leaguePoints, wins, losses, tier, hotstreak FROM summonersLeague WHERE summonerRegion='OC1' ORDER BY leaguePoints DESC LIMIT 1000"
    );

    res.status(200).json({
      status: "success",
      data: {
        leaderboard: leaderboard.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/leaderboard/tr", async (req, res) => {
  try {
    const leaderboard = await db.query(
      "SELECT summonerName, summonerRegion, leaguePoints, wins, losses, tier, hotstreak FROM summonersLeague WHERE summonerRegion='TR1' ORDER BY leaguePoints DESC LIMIT 1000"
    );

    res.status(200).json({
      status: "success",
      data: {
        leaderboard: leaderboard.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/leaderboard/euw", async (req, res) => {
  try {
    const leaderboard = await db.query(
      "SELECT summonerName, summonerRegion, leaguePoints, wins, losses, tier, hotstreak FROM summonersLeague WHERE summonerRegion='EUW1' ORDER BY leaguePoints DESC LIMIT 1000"
    );

    res.status(200).json({
      status: "success",
      data: {
        leaderboard: leaderboard.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/leaderboard/na", async (req, res) => {
  try {
    const leaderboard = await db.query(
      "SELECT summonerName, summonerRegion, leaguePoints, wins, losses, tier, hotstreak FROM summonersLeague WHERE summonerRegion='NA1' ORDER BY leaguePoints DESC LIMIT 1000"
    );

    res.status(200).json({
      status: "success",
      data: {
        leaderboard: leaderboard.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/leaderboard/kr", async (req, res) => {
  try {
    const leaderboard = await db.query(
      "SELECT summonerName, summonerRegion, leaguePoints, wins, losses, tier, hotstreak FROM summonersLeague WHERE summonerRegion='KR' ORDER BY leaguePoints DESC LIMIT 1000"
    );

    res.status(200).json({
      status: "success",
      data: {
        leaderboard: leaderboard.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/leaderboard/br", async (req, res) => {
  try {
    const leaderboard = await db.query(
      "SELECT summonerName, summonerRegion, leaguePoints, wins, losses, tier, hotstreak FROM summonersLeague WHERE summonerRegion='BR1' ORDER BY leaguePoints DESC LIMIT 1000"
    );

    res.status(200).json({
      status: "success",
      data: {
        leaderboard: leaderboard.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/augments", async (req, res) => {
  try {
    const augments = await db.query(
      "SELECT fr.augment_api_name, augments.augment_name, fr.frequency, ROUND(fr.average_placement, 2) as average_placement, ROUND((wfr.winfrequency/fr.frequency::decimal)*100, 2) as win_ratio, ROUND((fr.frequency::decimal/(SELECT COUNT(augment_api_name)/8 FROM match_participant_augment))*100, 2) as percentage_frequency FROM (SELECT augment_api_name, COUNT(placement) as frequency, AVG(placement) as average_placement FROM match_participant INNER JOIN match_participant_augment USING(match_id, puuid) GROUP BY augment_api_name) as fr  JOIN (SELECT augment_api_name, COUNT(placement) as winfrequency FROM match_participant INNER JOIN match_participant_augment USING(match_id, puuid) GROUP BY augment_api_name, placement HAVING placement=1) as wfr USING(augment_api_name) JOIN augments USING (augment_api_name) WHERE augment_variant='normal' GROUP BY fr.augment_api_name, augment_name, frequency, average_placement, winfrequency ORDER BY fr.average_placement"
    );

    res.status(200).json({
      status: "success",
      data: {
        augments: augments.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/teamcomps", async (req, res) => {
  try {
    const teamcomps = await db.query("SELECT * FROM teamcomps");

    res.status(200).json({
      status: "success",
      data: {
        teamcomps: teamcomps.rows,
      },
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/api/v1/items", async (req, res) => {
  // try {
  //   const items = await db.query(
  //     // "SELECT items.item_name, fr.item_id, fr.frequency, ROUND(fr.average_placement, 2) as average_placement, ROUND((wfr.winfrequency/fr.frequency::decimal)*100, 2) as win_ratio, ROUND((fr.frequency::decimal/(SELECT COUNT(item_id)/8 FROM match_participant_champion_item))*100, 2) as percentage_frequency FROM (SELECT item_id, COUNT(placement) as frequency, AVG(placement) as average_placement FROM match_participant INNER JOIN match_participant_champion_item USING(match_id, puuid) GROUP BY item_id) as fr  JOIN (SELECT item_id, COUNT(placement) as winfrequency FROM match_participant INNER JOIN match_participant_champion_item USING(match_id, puuid) GROUP BY item_id, placement HAVING placement=1) as wfr USING(item_id) JOIN items USING (item_id) GROUP BY fr.item_id, items.item_name, frequency, average_placement, winfrequency ORDER BY fr.frequency DESC"
  //     // "itemsplan3(1)",
  //     "SELECT items.item_name, fr.item_id, fr.frequency, ROUND(fr.average_placement, 2) as average_placement, ROUND((wfr.winfrequency/fr.frequency::decimal)*100, 2) as win_ratio, ROUND((fr.frequency::decimal/(SELECT COUNT(item_id)/8 FROM match_participant_champion_item))*100, 2) as percentage_frequency FROM (SELECT item_id, COUNT(placement) as frequency, AVG(placement) as average_placement FROM match_participant INNER JOIN match_participant_champion_item USING(match_id, puuid) GROUP BY item_id) as fr  JOIN (SELECT item_id, COUNT(placement) as winfrequency FROM match_participant INNER JOIN match_participant_champion_item USING(match_id, puuid) GROUP BY item_id, placement HAVING placement=$1) as wfr USING(item_id) JOIN items USING (item_id) GROUP BY fr.item_id, items.item_name, frequency, average_placement, winfrequency ORDER BY fr.frequency DESC",
  //     [1]
  //   );

  //   res.status(200).json({
  //     status: "success",
  //     data: {
  //       items: items.rows,
  //     },
  //   });
  // } catch (err) {
  //   console.log(err);
  // }
  const items = {
    name: "itemsplan3",
    text: "SELECT items.item_name, fr.item_id, fr.frequency, ROUND(fr.average_placement, 2) as average_placement, ROUND((wfr.winfrequency/fr.frequency::decimal)*100, 2) as win_ratio, ROUND((fr.frequency::decimal/(SELECT COUNT(item_id)/8 FROM match_participant_champion_item))*100, 2) as percentage_frequency FROM (SELECT item_id, COUNT(placement) as frequency, AVG(placement) as average_placement FROM match_participant INNER JOIN match_participant_champion_item USING(match_id, puuid) GROUP BY item_id) as fr  JOIN (SELECT item_id, COUNT(placement) as winfrequency FROM match_participant INNER JOIN match_participant_champion_item USING(match_id, puuid) GROUP BY item_id, placement HAVING placement=$1) as wfr USING(item_id) JOIN items USING (item_id) GROUP BY fr.item_id, items.item_name, frequency, average_placement, winfrequency ORDER BY fr.frequency DESC",
    values: [1],
  };

  db.query(items, (err, res) => {
    if (err) {
      console.log(err);
    } else {
    }
  });

  db.query(items).then((response) =>
    res.status(200).json({ status: "success", data: { items: response.rows } })
  );
});

//get origins data
app.get("/origins", async (req, res) => {
  try {
    const description = await db.query("SELECT * FROM origins");

    const effects = await db.query("SELECT * FROM origins_effects");

    res.status(200).json({
      status: "success",
      data: {
        description: description.rows,
        effects: effects.rows,
      },
    });
  } catch (err) {
    res.status(500).send(console.log(err));
  }
});

//get individual champion stats
app.get("/api/v1/champions/:name", async (req, res) => {
  try {
    console.log(req.params.name);
    const champion = await db.query(
      "SELECT fr2.three_items, fr2.frequency, ROUND(fr2.average_placement, 2) as average_placement, ROUND((wfr.winfrequency/fr2.frequency::decimal)*100, 2) as win_ratio, ROUND((fr2.frequency::decimal/(SELECT COUNT(ic.frequency) FROM (SELECT ARRAY_AGG(item_id ORDER BY item_id) as frequency FROM match_participant_champion_item INNER JOIN items USING(item_id) GROUP BY champion_api_name, match_id, puuid HAVING champion_api_name=$1) as ic))*100, 2) as percentage_frequency FROM (SELECT fr.three_items, COUNT(fr.three_items) as frequency, AVG(fr.placement) as average_placement FROM (SELECT ARRAY_AGG(item_id ORDER BY item_id) as three_items, champion_api_name, placement FROM match_participant INNER JOIN match_participant_champion_item USING(match_id, puuid) INNER JOIN items USING (item_id) GROUP BY champion_api_name, placement, match_id, puuid HAVING champion_api_name=$1 AND COUNT(item_id)=3) as fr GROUP BY fr.three_items ORDER BY COUNT(fr.three_items) DESC) as fr2 JOIN (SELECT fr.three_items, COUNT(fr.three_items) as winfrequency FROM (SELECT ARRAY_AGG(item_id ORDER BY item_id) as three_items, champion_api_name, placement FROM match_participant INNER JOIN match_participant_champion_item USING(match_id, puuid) INNER JOIN items USING (item_id) GROUP BY champion_api_name, placement, match_id, puuid HAVING champion_api_name=$1 AND COUNT(item_id)=3 AND placement=1) as fr GROUP BY fr.three_items) as wfr USING(three_items) WHERE fr2.frequency > 5 ORDER BY fr2.frequency DESC",
      [req.params.name]
    );

    res.status(200).json({
      status: "success",
      data: {
        championData: champion.rows,
      },
    });
  } catch (err) {
    res.status(500).send(console.log(err));
  }
});

//get individual restaurant
app.get("/api/v1/restaurants/:id", async (req, res) => {
  try {
    const restaurant = await db.query(
      "SELECT * FROM restaurants LEFT JOIN (SELECT restaurant_id, COUNT(*), TRUNC(AVG(rating), 1) AS average_rating FROM reviews GROUP BY restaurant_id) reviews ON restaurants.id = reviews.restaurant_id WHERE id=$1",
      [req.params.id]
    );
    //select * from restaurants where id = req.params.id

    const reviews = await db.query(
      "SELECT * FROM reviews WHERE restaurant_id=$1",
      [req.params.id]
    );

    res.status(200).json({
      status: "success",
      data: {
        restaurant: restaurant.rows[0],
        reviews: reviews.rows,
      },
    });
  } catch (err) {
    res.status(500).send(console.log(err));
  }
});

//create a restaurant
app.post("/api/v1/restaurants", async (req, res) => {
  try {
    const results = await db.query(
      "INSERT INTO restaurants (name, location, price_range) values ($1, $2, $3) RETURNING *",
      [req.body.name, req.body.location, req.body.price_range]
    );

    res.status(200).json({
      status: "success",
      data: {
        restaurant: results.rows[0],
      },
    });
  } catch (err) {
    console.log(err);
  }
});

//update a restaurant
app.put("/api/v1/restaurants/:id", async (req, res) => {
  try {
    const results = await db.query(
      "UPDATE restaurants SET name = $1, location = $2, price_range = $3 WHERE id = $4 RETURNING *",
      [req.body.name, req.body.location, req.body.price_range, req.params.id]
    );

    res.status(200).json({
      status: "success",
      data: {
        restaurant: results.rows[0],
      },
    });
  } catch (err) {
    console.log(err);
  }
});

//delete a restaurant
app.delete("/api/v1/restaurants/:id", async (req, res) => {
  try {
    const results = await db.query("DELETE FROM restaurants WHERE id = $1", [
      req.params.id,
    ]);
    res.status(204).json({
      status: "success",
    });
  } catch (err) {
    console.log(err);
  }
});

//add review
app.post("/api/v1/restaurants/:id/addReview", async (req, res) => {
  try {
    const results = await db.query(
      "INSERT INTO reviews (restaurant_id, name, review, rating) values ($1, $2, $3, $4) RETURNING *",
      [req.params.id, req.body.name, req.body.review, req.body.rating]
    );
    console.log(results);
    res.status(201).json({
      status: "success",
      data: {
        review: results.rows[0],
      },
    });
  } catch (err) {
    res.status(500).send(err);
    console.log(err);
  }
});

app.listen(port, () => {
  console.log(`Server is up and listening on port ${port}`);
});
