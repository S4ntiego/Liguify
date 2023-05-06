import Image from 'next/image'
import React, { useState } from 'react'
import SummonerFinder from '../apis/SummonerFinder'

export default function Search() {
  const [show, setShow] = useState(false)
  const [summonerName, setSummonerName] = useState('')
  const [regionVisible, setRegionVisible] = useState('EUNE')
  const [playerRegion, setPlayerRegion] = useState('eun1')
  const [summonerMatchData, setSummonerMatchData] = useState('')

  const handleSubmit = async (e) => {
    e.preventDefault()
    try {
      const response = await SummonerFinder.post('/', {
        region: playerRegion,
        summonerName: summonerName,
      })
      setSummonerMatchData(response.data)
    } catch (err) {
      console.log(err)
    }
  }

  function arrpush(arr) {
    var arr1 = arr

    for (var i = 0; i < 10; i++) {
      if (i > arr.length) {
        arr1.push('')
      }
    }

    return arr1
  }

  function secondsToHms(d) {
    d = Number(d)
    var h = Math.floor(d / 3600)
    var m = Math.floor((d % 3600) / 60)
    var s = Math.floor(d % 60)

    return [h, m > 9 ? m : h ? '0' + m : m || '0', s > 9 ? s : '0' + s]
      .filter(Boolean)
      .join(':')
  }

  return (
    <div className="relative mx-auto mb-8 flex min-h-[92vh] max-w-screen-2xl items-center justify-center gap-8">
      <div className="px-4 sm:px-7 2xl:container 2xl:mx-auto">
        <form className="relative z-20 flex items-center justify-center">
          <div className="absolute h-96 w-96 -translate-y-6">
            <Image
              className="object-cover"
              layout="fill"
              src="/images/Penguv3.png"
            />
          </div>
          {/* Filter & Search Container */}
          <div className="flex flex-row items-center justify-center rounded">
            {/* Region Filter - Relative Container for Dropdown */}
            {/* Search Bar */}
            <div>
              <div className="py-4 sm:py-6 2xl:container 2xl:mx-auto">
                <div className="flex w-96 justify-between">
                  {/* Search Icon */}
                  <div className="flex items-center rounded-l bg-[#202026] pl-2">
                    <div
                      onClick={handleSubmit}
                      className="mx-3 cursor-pointer text-gray-200"
                    >
                      <svg
                        className="z-20 cursor-pointer"
                        width={16}
                        height={16}
                        viewBox="0 0 16 16"
                        fill="#CF6679"
                        xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                          d="M14.2716 13.1684L11.3313 10.2281C12.0391 9.28574 12.4213 8.13865 12.42 6.96C12.42 3.94938 9.97063 1.5 6.96 1.5C3.94938 1.5 1.5 3.94938 1.5 6.96C1.5 9.97063 3.94938 12.42 6.96 12.42C8.13865 12.4213 9.28574 12.0391 10.2281 11.3313L13.1684 14.2716C13.3173 14.4046 13.5114 14.4756 13.711 14.47C13.9105 14.4645 14.1004 14.3827 14.2415 14.2415C14.3827 14.1004 14.4645 13.9105 14.47 13.711C14.4756 13.5114 14.4046 13.3173 14.2716 13.1684ZM3.06 6.96C3.06 6.18865 3.28873 5.43463 3.71727 4.79328C4.14581 4.15192 4.7549 3.65205 5.46754 3.35687C6.18017 3.06169 6.96433 2.98446 7.72085 3.13494C8.47738 3.28542 9.17229 3.65686 9.71772 4.20228C10.2631 4.74771 10.6346 5.44262 10.7851 6.19915C10.9355 6.95567 10.8583 7.73983 10.5631 8.45247C10.268 9.1651 9.76808 9.77419 9.12673 10.2027C8.48537 10.6313 7.73135 10.86 6.96 10.86C5.92604 10.8588 4.93478 10.4475 4.20365 9.71635C3.47253 8.98522 3.06124 7.99396 3.06 6.96Z"
                          fill="#CF6679"
                        />
                      </svg>
                    </div>
                  </div>
                  {/* Search Summoner Input */}
                  <input
                    className="relative z-30 w-full bg-[#202026] py-5 pl-2 text-sm text-gray-200 outline-none lg:max-w-[452px]"
                    value={summonerName}
                    onChange={(e) => setSummonerName(e.target.value)}
                    type="text"
                    placeholder="Search Summoner..."
                  />
                </div>
              </div>
            </div>
            {/* Region Filter */}
            <div className="relative">
              {/* Container for Filter & Arrow Dropdown */}
              <div className="">
                <div
                  className="flex w-28 justify-between rounded-r bg-[#202026]"
                  onClick={() => setShow(!show)}
                >
                  {/* Container for Region Filter */}
                  <p className="items-center justify-center px-3 py-5 text-sm font-bold tracking-normal text-gray-200">
                    {regionVisible}
                  </p>
                  {/* Container for Arrow Icon & Arrow Box */}
                  <div className="flex items-center">
                    {/* Container for Arrow Only - hover effect will work only on Arrow Icon */}
                    <div className="mx-3 cursor-pointer text-gray-200">
                      {show ? (
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          className="icon icon-tabler icon-tabler-chevron-up"
                          width={20}
                          height={20}
                          viewBox="0 0 24 24"
                          strokeWidth="1.5"
                          stroke="currentColor"
                          fill="none"
                          strokeLinecap="round"
                          strokeLinejoin="round"
                        >
                          <path stroke="none" d="M0 0h24v24H0z" />
                          <polyline points="6 15 12 9 18 15" />
                        </svg>
                      ) : (
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          className="icon icon-tabler icon-tabler-chevron-up"
                          width={20}
                          height={20}
                          viewBox="0 0 24 24"
                          strokeWidth="1.5"
                          stroke="currentColor"
                          fill="none"
                          strokeLinecap="round"
                          strokeLinejoin="round"
                        >
                          <path stroke="none" d="M0 0h24v24H0z" />
                          <polyline points="6 9 12 15 18 9" />
                        </svg>
                      )}
                    </div>
                  </div>
                </div>
              </div>
              {/* Dropdown */}
              {show && (
                <ul
                  value={playerRegion}
                  className="absolute mt-3 w-28 rounded bg-[#202026] py-1 opacity-100 transition duration-300"
                >
                  <li
                    type="text"
                    value="br1"
                    onClick={(e) => (
                      setRegionVisible(e.target.innerHTML),
                      setShow(false),
                      setPlayerRegion(e.target.getAttribute('value'))
                    )}
                    className={`${
                      regionVisible === 'BR' ? 'text-red-500' : ''
                    } flex cursor-pointer items-center py-3 px-3 text-sm leading-3 tracking-normal text-gray-600 hover:bg-gray-100`}
                  >
                    BR
                  </li>
                  <li
                    type="text"
                    value="eun1"
                    onClick={(e) => (
                      setRegionVisible(e.target.innerHTML),
                      setShow(false),
                      setPlayerRegion(e.target.getAttribute('value'))
                    )}
                    className="flex cursor-pointer items-center py-3 px-3 text-sm leading-3 tracking-normal text-gray-600 hover:bg-gray-100"
                  >
                    EUNE
                  </li>
                  <li
                    type="text"
                    value="euw1"
                    onClick={(e) => (
                      setRegionVisible(e.target.innerHTML),
                      setShow(false),
                      setPlayerRegion(e.target.getAttribute('value'))
                    )}
                    className="flex cursor-pointer items-center py-3 px-3 text-sm leading-3 tracking-normal text-gray-600 hover:bg-gray-100"
                  >
                    EUW
                  </li>
                  <li
                    type="text"
                    value="jp1"
                    onClick={(e) => (
                      setRegionVisible(e.target.innerHTML),
                      setShow(false),
                      setPlayerRegion(e.target.getAttribute('value'))
                    )}
                    className="flex cursor-pointer items-center py-3 px-3 text-sm leading-3 tracking-normal text-gray-600 hover:bg-gray-100 "
                  >
                    JP
                  </li>
                  <li
                    type="text"
                    value="kr"
                    onClick={(e) => (
                      setRegionVisible(e.target.innerHTML),
                      setShow(false),
                      setPlayerRegion(e.target.getAttribute('value'))
                    )}
                    className="flex cursor-pointer items-center py-3 px-3 text-sm leading-3 tracking-normal text-gray-600 hover:bg-gray-100"
                  >
                    KR
                  </li>
                  <li
                    type="text"
                    value="la1"
                    onClick={(e) => (
                      setRegionVisible(e.target.innerHTML),
                      setShow(false),
                      setPlayerRegion(e.target.getAttribute('value'))
                    )}
                    className="flex cursor-pointer items-center py-3 px-3 text-sm leading-3 tracking-normal text-gray-600 hover:bg-gray-100"
                  >
                    LAN
                  </li>
                  <li
                    type="text"
                    value="la2"
                    onClick={(e) => (
                      setRegionVisible(e.target.innerHTML),
                      setShow(false),
                      setPlayerRegion(e.target.getAttribute('value'))
                    )}
                    className="flex cursor-pointer items-center py-3 px-3 text-sm leading-3 tracking-normal text-gray-600 hover:bg-gray-100"
                  >
                    LAS
                  </li>
                  <li
                    type="text"
                    value="na1"
                    onClick={(e) => (
                      setRegionVisible(e.target.innerHTML),
                      setShow(false),
                      setPlayerRegion(e.target.getAttribute('value'))
                    )}
                    className="flex cursor-pointer items-center py-3 px-3 text-sm leading-3 tracking-normal text-gray-600 hover:bg-gray-100 "
                  >
                    NA
                  </li>
                  <li
                    type="text"
                    value="oc1"
                    onClick={(e) => (
                      setRegionVisible(e.target.innerHTML),
                      setShow(false),
                      setPlayerRegion(e.target.getAttribute('value'))
                    )}
                    className="flex cursor-pointer items-center py-3 px-3 text-sm leading-3 tracking-normal text-gray-600 hover:bg-gray-100"
                  >
                    OCE
                  </li>
                  <li
                    type="text"
                    value="tr1"
                    onClick={(e) => (
                      setRegionVisible(e.target.innerHTML),
                      setShow(false),
                      setPlayerRegion(e.target.getAttribute('value'))
                    )}
                    className="flex cursor-pointer items-center py-3 px-3 text-sm leading-3 tracking-normal text-gray-200 hover:bg-gray-100"
                  >
                    TR
                  </li>
                  <li
                    type="text"
                    value="ru"
                    onClick={(e) => (
                      setRegionVisible(e.target.innerHTML),
                      setShow(false),
                      setPlayerRegion(e.target.getAttribute('value'))
                    )}
                    className="flex cursor-pointer items-center py-3 px-3 text-sm leading-3 tracking-normal text-gray-600 hover:bg-gray-100"
                  >
                    RU
                  </li>
                </ul>
              )}
            </div>
          </div>
          <input onClick={handleSubmit} type="submit" hidden />
        </form>

        {/* Match List */}
        <div className="container mx-auto h-full">
          {summonerMatchData &&
            summonerMatchData.playerData.map((match, index) => (
              <div className={`mb-4 rounded-xl bg-[#202026] bg-gradient-to-r`}>
                <div className="flex h-1/4 w-full flex-col">
                  <div className="border-1 mx-4 flex justify-between border-b border-[#18181c] py-2">
                    <div className={`flex`}>
                      {match.traits
                        .slice()
                        .sort((a, b) =>
                          a.tier_current < b.tier_current ? 1 : -1
                        )
                        .map((trait) => (
                          <div>
                            {trait.tier_current === 1 ? (
                              <img
                                width="26"
                                height="26"
                                className="rounded"
                                src={`https://cdn.metatft.com/file/metatft/set6/traits/${trait.name
                                  .substring(trait.name.indexOf('_') + 1)
                                  .toLowerCase()}_bronze.png`}
                                alt="avatar"
                              />
                            ) : trait.tier_current === 2 ? (
                              <img
                                width="26"
                                height="26"
                                className="rounded"
                                src={`https://cdn.metatft.com/file/metatft/set6/traits/${trait.name
                                  .substring(trait.name.indexOf('_') + 1)
                                  .toLowerCase()}_silver.png`}
                                alt="avatar"
                              />
                            ) : trait.tier_current === 3 ? (
                              <img
                                width="26"
                                height="26"
                                className="rounded"
                                src={`https://cdn.metatft.com/file/metatft/set6/traits/${trait.name
                                  .substring(trait.name.indexOf('_') + 1)
                                  .toLowerCase()}_gold.png`}
                                alt="avatar"
                              />
                            ) : trait.tier_current === 4 ? (
                              <img
                                width="26"
                                height="26"
                                className="rounded"
                                src={`https://cdn.metatft.com/file/metatft/set6/traits/${trait.name
                                  .substring(trait.name.indexOf('_') + 1)
                                  .toLowerCase()}_plat.png`}
                                alt="avatar"
                              />
                            ) : (
                              ''
                            )}
                          </div>
                        ))}
                      <div className=""></div>
                    </div>
                    <div className="flex items-center justify-center text-white">
                      <p className="font-rubik text-xs">
                        Patch:{' '}
                        {summonerMatchData &&
                          summonerMatchData.matchData[
                            index
                          ].info.game_version.substring(
                            summonerMatchData.matchData[
                              index
                            ].info.game_version.indexOf(' ') + 1,
                            13
                          )}
                      </p>
                    </div>
                  </div>
                  {/* Bottom part */}
                  <div className="mx-4 flex w-full flex-row py-4">
                    <div className="mx-4 flex flex-col items-center justify-center">
                      <div className="relative h-14 w-14 rounded-full">
                        <Image
                          className="rounded-full"
                          layout="fill"
                          objectFit="contain"
                          src={`https://cdn.tft.tools/little-legends/${match.companion.content_ID}.png`}
                        />
                        <div className="absolute bottom-0 flex h-5 w-5 translate-x-11 translate-y-1 items-center justify-center rounded-full bg-[#202026] font-rubik text-sm font-bold text-white">
                          {match.level}
                        </div>
                      </div>
                    </div>
                    <div className="mx-4 flex flex-col items-start justify-center gap-2 text-xs">
                      <p
                        className={`font-rubik font-bold uppercase ${
                          match.placement === 1
                            ? 'text-yellow-500'
                            : match.placement === 2
                            ? 'text-gray-400'
                            : match.placement === 3
                            ? ' text-amber-600'
                            : 'text-gray-100'
                        }`}
                      >
                        {match.placement}
                        {match.placement === 1
                          ? 'st'
                          : match.placement === 2
                          ? 'nd'
                          : match.placement === 3
                          ? 'rd'
                          : 'th'}{' '}
                        place
                      </p>
                      <p className="text-gray-100">
                        {summonerMatchData.matchData[index].info.queue_id ===
                        1100
                          ? 'Ranked '
                          : summonerMatchData.matchData[index].info.queue_id ===
                            1090
                          ? 'Normal '
                          : summonerMatchData.matchData[index].info.queue_id ===
                            1150
                          ? 'Double-up '
                          : ''}
                        {secondsToHms(match.time_eliminated)}
                      </p>
                      <p className="text-gray-100">
                        {new Date(
                          summonerMatchData.matchData[index].info.game_datetime
                        ).toLocaleDateString('en-GB')}
                      </p>
                    </div>
                    {/* Champions Container */}
                    <div className="mx-4 flex w-2/3">
                      {/* Champions Grid */}
                      <div className="grid grid-cols-10 gap-2">
                        {arrpush(match.units).map((unit) => (
                          <div className="flex flex-col">
                            {unit.items ? (
                              <Image
                                height="64"
                                width="64"
                                className="rounded"
                                src={`https://cdn.tft.tools/face/${unit.character_id}.jpg`}
                                alt="avatar"
                              />
                            ) : (
                              <div className="aspect-square w-full rounded bg-[#18181c] shadow-inner shadow-black"></div>
                            )}
                            <div className="mt-[2px] grid grid-cols-3">
                              {unit.items &&
                                unit.items.map((item) => (
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
                  </div>
                </div>
              </div>
            ))}
        </div>
      </div>
    </div>
  )
}
