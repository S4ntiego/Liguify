const { RiotAPI, RiotAPITypes, PlatformId } = require("@fightmegg/riot-api");
const db = require("../../../db");

module.exports = async function challengerLeague(region) {
  const rAPI = await new RiotAPI(process.env.RIOT_API_KEY);

  const challenger = await rAPI.tftLeague.getChallenger({
    region,
  });

  challenger.entries.map(async (entry) => {
    try {
      await db.query(
        "INSERT INTO summonersLeague (summonerId, summonerName, leaguePoints, summonerRank, wins, losses, veteran, inactive, freshblood, hotstreak, leagueId, queueType, tier) values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) ON CONFLICT (summonerId) DO UPDATE SET summonerName = $2, leaguePoints = $3, summonerRank = $4, wins = $5, losses = $6, veteran = $7, inactive = $8, freshBlood = $9, hotStreak = $10, leagueId = $11, queueType = $12, tier = $13",
        [
          entry.summonerId,
          entry.summonerName,
          entry.leaguePoints,
          entry.rank,
          entry.wins,
          entry.losses,
          entry.veteran,
          entry.inactive,
          entry.freshBlood,
          entry.hotStreak,
          challenger.leagueId,
          challenger.queue,
          challenger.tier,
        ]
      );
    } catch (err) {
      console.log(err);
    }
  });
  console.log(region, "done");
};
