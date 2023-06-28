// for (let array of arrays) {
//     var matchList = await rAPI.tftMatch.getMatchIdsByPUUID({
//       region,
//       puuid: array,
//       params: {
//         startTime,
//         count: 500,
//       },
//     });

//     const request = async () => {
//       console.log("middle", matchList.length);
//       matchList.splice(0, chunkSize);
//       console.log("final", matchList.length);

//       if (matchList.length) {
//         //delay between calls in one player loop
//         await delay(5000);
//         request();
//       }
//     };
//     if (matchList.length) {
//       console.log("initial", matchList.length);
//       request();
//       //delay between all the players loop
//       await delay(20000);
//     }
