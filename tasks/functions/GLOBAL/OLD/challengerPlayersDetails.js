const { RiotAPI, RiotAPITypes, PlatformId } = require("@fightmegg/riot-api");
const db = require("../../../db");

module.exports = async function challengerPlayersDetails(
  array,
  chunkSize,
  region,
  req,
  res
) {
  const rAPI = await new RiotAPI(process.env.RIOT_API_KEY);
  var delay = 3000;
  var remaining = array.length;
  var promises = [];
  var addPromises = function (newPromises) {
    Array.prototype.push.apply(promises, newPromises);
    if (remaining === promises.length) {
      Promise.all(promises).then((data) => {
        data.map(async (summonerxD) => {
          try {
            await db.query(
              "INSERT INTO summoners (puuid, accountId, summonerName, profileIconId, summonerId, revisionDate, summonerLevel, summonerRegion) values ($1, $2, $3, $4, $5, $6, $7, $8) ON CONFLICT (summonerId) DO UPDATE SET puuid = $1, accountId = $2, summonerName = $3, profileIconId = $4, summonerId = $5, revisionDate = $6, summonerLevel = $7, summonerRegion = $8",
              [
                summonerxD.puuid,
                summonerxD.accountId,
                summonerxD.name,
                summonerxD.profileIconId,
                summonerxD.id,
                summonerxD.revisionDate,
                summonerxD.summonerLevel,
                region,
              ]
            );
          } catch (err) {
            console.log(err);
          }
        });
      });
      res.status(200).json({
        status: "success",
      });
    }
  };
  (function request() {
    addPromises(
      array.splice(0, chunkSize).map(async (entry) => {
        return await rAPI.tftSummoner.getBySummonerId({
          region,
          summonerId: entry.summonerId,
        });
      })
    );
    if (array.length) {
      setTimeout(request, delay);
    }
  })();
};
