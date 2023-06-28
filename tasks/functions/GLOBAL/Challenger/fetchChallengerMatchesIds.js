const { RiotAPI, RiotAPITypes, PlatformId } = require("@fightmegg/riot-api");
const db = require("../../../db");
const delay = require("../../Additional/delay");

module.exports = fetchChallengers = async (
  arrays,
  region,
  chunkSize,
  delayTime,
  startTime
) => {
  const rAPI = await new RiotAPI(process.env.RIOT_API_KEY);
  const arrayLength = arrays.length;
  let totalIndex = 0;
  for (let array of arrays) {
    (async function fetchMatchesIdBySummonerId() {
      let splicedCalls = arrays
        .splice(0, chunkSize)
        .forEach(async (matchId, i) => {
          try {
            const match = await rAPI.tftMatch.getById({
              region,
              matchId,
            });
          } catch (err) {
            console.log(err);
          }
        });

      if (array.length) {
        await delay(delayTime);
        fetchMatchesIdBySummonerId();
      }

      if (!array) {
        console.log("done");
      }
    })();

    //how much time between windows of series of calls
    await delay(12000);
  }
};
