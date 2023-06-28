const { RiotAPI, RiotAPITypes, PlatformId } = require("@fightmegg/riot-api");
const db = require("../../../db");

module.exports = async function masterPlayers(region) {
  const rAPI = await new RiotAPI(process.env.RIOT_API_KEY);
  try {
    const data = await rAPI.tftLeague.getMaster({
      region,
    });
    return data.entries;
  } catch (err) {
    console.log(err);
  }
};
