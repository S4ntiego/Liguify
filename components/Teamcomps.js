import React from 'react'
import Image from 'next/image'
import { useEffect, useContext } from 'react'
import TeamcompList from '../apis/TeamcompList'
import { ChampionsContext } from '../context/ChampionsContext'

export default function Teamcomps() {
  const { teamcompsData, setTeamcompsData, setActiveTab } =
    useContext(ChampionsContext)

  useEffect(() => {
    setActiveTab(2)
    const fetchData = async () => {
      if (!teamcompsData) {
        try {
          const response = await TeamcompList.get()

          setTeamcompsData(response.data.data.teamcomps)
        } catch (err) {
          console.log(err)
        }
      }
    }

    fetchData()
  }, [])

  const borders = {
    Varus: 'outline-blue-500',
    Vladimir: 'outline-gray-500',
    Skarner: 'outline-gray-500',
    Nidalee: 'outline-gray-500',
    DragonGreen: 'outline-purple-500',
    Yasuo: 'outline-yellow-500',
    Soraka: 'outline-yellow-500',
    Anivia: 'outline-blue-500',
    Nami: 'outline-green-500',
    Lulu: 'outline-blue-500',
    Illaoi: 'outline-blue-500',
    Sylas: 'outline-blue-500',
    Bard: 'outline-yellow-500',
    AurelionSol: 'outline-yellow-500',
    Zoe: 'outline-yellow-500',
    Neeko: 'outline-purple-500',
  }

  let filteredTeamcomps = Object.values({ ...teamcompsData })
  let teamcompsFrequency = teamcompsData
    ?.map((teamcomp) => teamcomp.comp_frequency)
    .reduce((a, b) => parseInt(a) + parseInt(b))

  let teamcomps = teamcompsData?.map((teamcomp) => {
    return teamcomp.teamcomp
  })

  for (let i = 0; i < teamcomps?.length; i++) {
    const data = teamcomps?.filter(
      (combination) =>
        combination.filter((v) => {
          return teamcomps?.[i].indexOf(v) > -1
        }).length >= 6 && combination !== teamcomps?.[i]
    )

    let indexes = data.map((teamcomp) => teamcomps.indexOf(teamcomp))
    indexes.sort(function (a, b) {
      return b - a
    })

    indexes.map((index) => teamcomps.splice(index, 1))
    indexes.map((index) => filteredTeamcomps.splice(index, 1))
  }

  let origins = filteredTeamcomps?.map((team) => team.origins)
  let traits = filteredTeamcomps?.map((team) => team.traits)

  function duplicatesCounts(arr) {
    var counts = {}
    arr?.forEach((n) => {
      // if property counts[n] doesn't exist, create it
      counts[n] = counts[n] || 0
      // now increment it
      counts[n]++
    })

    return Object.entries(counts).sort(([, a], [, b]) => b - a)
  }

  let filteredOrigins = origins?.map((origin) => duplicatesCounts(origin))
  let filteredTraits = traits?.map((trait) => duplicatesCounts(trait))

  return (
    <div className="relative mx-auto mb-8 flex min-h-[92vh] max-w-screen-lg items-center justify-center">
      {console.log(teamcompsData)}
      {console.log(borders)}
      <div className="px-4 py-4 sm:px-7 sm:py-6 2xl:container 2xl:mx-auto">
        <div className="container mx-auto h-full">
          {filteredTeamcomps &&
            filteredTeamcomps.map((team, i) => (
              // Container (bg, color, mb, round)
              <div className={`mb-4 rounded-xl bg-[#202026] bg-gradient-to-r`}>
                {/* Upper Part */}
                <div className="border-1 mx-4 flex justify-between border-b border-[#18181c] py-2">
                  <p className="font-rubik text-gray-200">
                    {filteredOrigins[i][0][1] > 2 &&
                      `${filteredOrigins[i][0][1]} ${filteredOrigins[i][0][0]}`}
                    {filteredTraits[i][0][1] > 2 &&
                      ` & ${filteredTraits[i][0][1]} ${filteredTraits[i][0][0]}`}
                    {` - ${team.most_frequent_itemized_champion}`}
                  </p>
                </div>
                <div className="flex">
                  {/* Champions Container */}
                  <div className="mx-4 py-2">
                    {/* Champions Grid */}
                    <div className="grid grid-cols-8 gap-6">
                      {team.teamcomp.map((unit) => (
                        <div className="relative flex flex-col">
                          {unit != 'TrainerDragon' && (
                            <div
                              className={`relative aspect-square h-12 w-12 rounded outline outline-2 ${borders[unit]}`}
                            >
                              <Image
                                layout="fill"
                                className={`rounded`}
                                src={`https://f004.backblazeb2.com/file/Liguify/champions/tft7_${unit.toLowerCase()}.webp`}
                                alt="avatar"
                              />
                            </div>
                          )}
                          <div className="-mt-2 grid w-12 grid-cols-3 p-1">
                            {unit === team.champion_api_name &&
                              team.most_frequent_build.map((item) => (
                                <div className="relative aspect-square">
                                  <Image
                                    layout="fill"
                                    objectFit="cover"
                                    className="rounded"
                                    src={`https://cdn.tft.tools/items/61_${item}.jpg`}
                                    alt="item"
                                  />
                                </div>
                              ))}
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                  {/* Outer container for statistics - width, flex */}
                  <div className="flex w-3/5 justify-center gap-12 py-2 text-sm text-gray-400">
                    {/* First inner column */}
                    <div className="flex flex-col gap-2">
                      {/* First statistic */}
                      <div className="flex gap-4">
                        <span>Winrate:</span>
                        <span className="text-white">{team.win_ratio}%</span>
                      </div>
                      {/* Second statistic */}
                      <div>
                        <span>Avg Place:</span>
                        <span className="float-right text-gray-200">
                          {team.avg_place}
                        </span>
                      </div>
                    </div>
                    {/* Second inner column */}
                    <div className="flex flex-col gap-2">
                      {/* First statistic */}
                      <div className="flex gap-4">
                        <span>Top4:</span>
                        <span className="text-gray-200">
                          {team.top4_ratio}%
                        </span>
                      </div>
                      <div>
                        <span>Pick: </span>
                        <span className="float-right text-gray-200">
                          {(
                            (team.comp_frequency /
                              (teamcompsFrequency / 8 / 4)) *
                            100
                          ).toFixed(2)}
                          %
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            ))}
        </div>
      </div>
    </div>
  )
}
