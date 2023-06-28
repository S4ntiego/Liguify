const { RiotAPI, RiotAPITypes, PlatformId } = require("@fightmegg/riot-api");
const db = require("../../../db");
const delay = require("../../Additional/delay");

module.exports = fetchGrandmasters = async (
  arrays,
  region,
  chunkSize,
  delayTime
) => {
  const rAPI = await new RiotAPI(process.env.RIOT_API_KEY);
  const arrayLength = arrays.length;
  let totalIndex = 0;
  const request = async () => {
    arrays.splice(0, chunkSize).map(async (summonerData, i) => {
      try {
        const summoner = await rAPI.tftSummoner.getBySummonerId({
          region,
          summonerId: summonerData.summonerId,
        });
        await db.query(
          "INSERT INTO summoners (puuid, accountId, summonerName, profileIconId, summonerId, revisionDate, summonerLevel, summonerRegion) values ($1, $2, $3, $4, $5, $6, $7, $8) ON CONFLICT (summonerId) DO UPDATE SET puuid = $1, accountId = $2, summonerName = $3, profileIconId = $4, summonerId = $5, revisionDate = $6, summonerLevel = $7, summonerRegion = $8",
          [
            summoner.puuid,
            summoner.accountId,
            summoner.name,
            summoner.profileIconId,
            summoner.id,
            summoner.revisionDate,
            summoner.summonerLevel,
            region,
          ]
        );
        totalIndex += 1;
        console.log(region, summoner.name, "inserted");
      } catch (err) {
        console.log(err);
      }
    });

    if (arrays.length) {
      console.log(totalIndex, "/", arrayLength);
      //delay between calls in one player loop
      await delay(delayTime);
      await request();
    }
  };
  if (arrays.length) {
    await request();
    //delay between all the players loop
    await delay(delayTime);
  }
};
