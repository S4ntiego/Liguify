const { RiotAPI, RiotAPITypes, PlatformId } = require("@fightmegg/riot-api");
const db = require("../../../db");

module.exports = async function grandmasterPlayers(region) {
  const rAPI = await new RiotAPI(process.env.RIOT_API_KEY);
  try {
    const data = await rAPI.tftLeague.getGrandmaster({
      region,
    });
    return data.entries;
  } catch (err) {
    console.log(err);
  }
};
