import React from 'react'
import { useEffect, useState, useContext } from 'react'
import {
  createColumnHelper,
  flexRender,
  getCoreRowModel,
  getSortedRowModel,
  getFilteredRowModel,
  useReactTable,
  getPaginationRowModel,
} from '@tanstack/react-table'
import { useQuery } from '@tanstack/react-query'
import LeaderboardAPI from '../apis/LeaderboardAPI'
import { ChampionsContext } from '../context/ChampionsContext'

export const Leaderboard = () => {
  const [region, setRegion] = useState('GLOBAL')
  const { setActiveTab } = useContext(ChampionsContext)

  useEffect(() => {
    setActiveTab(4)
  }, [])

  return (
    <div>
      <LeaderboardReturn region={region} setRegion={setRegion} />
    </div>
  )
}

const regions = [
  'GLOBAL',
  'BR',
  'EUNE',
  'JP',
  'EUW',
  'KR',
  'LAN',
  'LAS',
  'NA',
  'OCE',
  'TR',
]

const getLeaderboardByRegion = async (region) => {
  const pepega = await LeaderboardAPI.get(`/${region}`)
  return pepega.data.data.leaderboard
}

const useLeaderboard = (region) => {
  return useQuery(
    ['leaderboard', region],
    () => getLeaderboardByRegion(region),
    {
      refetchOnWindowFocus: false,
      refetchOnMount: false,
      staleTime: 50000,
      cacheTime: 50000,
    }
  )
}

const LeaderboardReturn = ({ region, setRegion }) => {
  const [sorting, setSorting] = useState()
  const [globalFilter, setGlobalFilter] = useState('')
  const [pageIndex, setPageIndex] = useState(0)
  const [pageSize, setPageSize] = useState(100)

  const { status, data, error, isFetching, isLoading } = useLeaderboard(region)

  const onRegionClick = (region) => {
    setRegion(region)
  }

  const pagination = React.useMemo(
    () => ({
      pageIndex,
      pageSize,
    }),
    [pageIndex, pageSize]
  )

  const columnHelper = createColumnHelper()

  const columns = React.useMemo(
    () => [
      columnHelper.accessor('#', {
        cell: (info) => (
          <div className="w-12 pl-4 text-right">{info.row.index + 1}</div>
        ),
        header: () => <div className="w-12 pl-4 text-right">Rank</div>,
      }),
      columnHelper.accessor('summonerregion', {
        cell: (info) => (
          <div className="w-16 pl-8 text-left">{info.getValue()}</div>
        ),
        header: () => <div className="w-16 pl-8 text-left">Region</div>,
      }),
      columnHelper.accessor('summonername', {
        header: () => <div className="w-56 pl-10 text-left">Summoner</div>,
        cell: (info) => (
          <div className="w-56 pl-10 text-left">{info.renderValue()}</div>
        ),
      }),
      columnHelper.accessor('leaguepoints', {
        cell: (info) => (
          <div className="w-24 pl-10 text-right">{info.getValue()}</div>
        ),
        header: () => <div className="w-24 pl-10 text-right">LP</div>,
      }),
      columnHelper.accessor('tier', {
        cell: (info) => (
          <div className="w-36 pr-4 pl-4 text-left">{info.getValue()}</div>
        ),
        header: () => <div className="w-36 pl-4 pr-4 text-left">Tier</div>,
      }),
      columnHelper.accessor('wins', {
        cell: (info) => (
          <div className="w-30 pl-10 pr-4 text-right">{info.getValue()}</div>
        ),
        header: () => <div className="w-30 pl-10 pr-4 text-right">Top4</div>,
      }),
      columnHelper.accessor('losses', {
        cell: (info) => (
          <div className="w-30 pl-10 pr-4 text-right">{info.getValue()}</div>
        ),
        header: () => <div className="w-30 pl-10 pr-4 text-right">Losses</div>,
      }),
    ],
    []
  )

  const table = useReactTable({
    data,
    columns,
    state: {
      pagination,
      sorting,
      globalFilter,
    },
    getFilteredRowModel: getFilteredRowModel(),
    onSortingChange: setSorting,
    getSortedRowModel: getSortedRowModel(),
    getCoreRowModel: getCoreRowModel(),
    getPaginationRowModel: getPaginationRowModel(),
  })

  return (
    <div>
      {status === 'loading' ? (
        <div className=" flex flex-col justify-center">
          {
            <div className="flex justify-center gap-4 pt-8 pb-4">
              {regions.map((region, i) => (
                <button
                  onClick={() => {
                    ;`${onRegionClick(region)};${setPageIndex(0)};${setSorting(
                      []
                    )}`
                  }}
                  className={`${`bg-gray-200 text-[#202026]`} w-24 rounded bg-[#202026] px-6 py-3 text-center text-xs text-white transition duration-150 ease-in-out hover:bg-gray-200 hover:text-[#202026] focus:outline-none`}
                >
                  {region}
                </button>
              ))}
            </div>
          }
          <div className="mx-auto mt-24 flex h-[100px] w-[100px] animate-spin">
            <svg
              className="absolute top-0 left-0"
              width={100}
              height={100}
              viewBox="0 0 177 177"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M169.667 88.5C173.717 88.5 177.032 85.2113 176.696 81.1755C175.457 66.2542 170.448 51.8477 162.085 39.332C152.361 24.7783 138.539 13.435 122.367 6.73666C106.196 0.0383073 88.4018 -1.71429 71.2345 1.7005C54.0672 5.11529 38.298 13.5441 25.9211 25.921C13.5441 38.298 5.1153 54.0672 1.7005 71.2345C-1.71429 88.4018 0.0383044 106.196 6.73666 122.367C13.435 138.539 24.7783 152.361 39.332 162.085C51.8477 170.448 66.2542 175.457 81.1755 176.696C85.2113 177.032 88.5 173.717 88.5 169.667V169.667C88.5 165.618 85.2089 162.373 81.1792 161.971C69.1624 160.774 57.5826 156.642 47.4795 149.891C35.3374 141.778 25.8738 130.247 20.2855 116.755C14.6971 103.264 13.2349 88.4181 16.0838 74.0955C18.9328 59.773 25.9649 46.6168 36.2909 36.2908C46.6169 25.9649 59.773 18.9328 74.0955 16.0838C88.4181 13.2349 103.264 14.6971 116.755 20.2855C130.247 25.8739 141.778 35.3375 149.891 47.4795C156.642 57.5826 160.774 69.1624 161.971 81.1793C162.373 85.209 165.618 88.5 169.667 88.5V88.5Z"
                fill="#999999"
              />
            </svg>
          </div>
        </div>
      ) : status === 'error' ? (
        <span>Error: {error.message}</span>
      ) : (
        <div className=" flex flex-col justify-center">
          {
            <div className="flex justify-center gap-4 pt-8 pb-4">
              {regions.map((region, i) => (
                <button
                  onClick={() => {
                    ;`${onRegionClick(region)};${setPageIndex(0)};${setSorting(
                      []
                    )}`
                  }}
                  className={`${`bg-gray-200 text-[#202026]`} w-24 rounded bg-[#202026] px-6 py-3 text-center text-xs text-white transition duration-150 ease-in-out hover:bg-gray-200 hover:text-[#202026] focus:outline-none`}
                >
                  {region}
                </button>
              ))}
            </div>
          }
          {data && (
            <div className="flex justify-center">
              <table className="w-full">
                <thead>
                  {table?.getHeaderGroups().map((headerGroup) => (
                    <tr
                      key={headerGroup.id}
                      className="h-16 w-full text-sm leading-none text-gray-200"
                    >
                      {headerGroup.headers.map((header) => (
                        <th
                          colSpan={header.colSpan}
                          className="cursor-pointer font-normal"
                          key={header.id}
                        >
                          {header.isPlaceholder ? null : (
                            <div
                              {...{
                                className: header.column.getCanSort()
                                  ? 'cursor-pointer select-none'
                                  : '',
                                onClick:
                                  header.column.getToggleSortingHandler(),
                              }}
                            >
                              <div className="relative flex flex-row">
                                {flexRender(
                                  header.column.columnDef.header,
                                  header.getContext()
                                )}
                                <div
                                  className={`${
                                    header.column.id === 'frequency'
                                      ? 'ml-1 justify-end'
                                      : ''
                                  } flex items-center`}
                                >
                                  {{
                                    asc: (
                                      <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        className="absolute h-5 w-5 text-blue-500"
                                        viewBox="0 0 20 20"
                                        fill="currentColor"
                                      >
                                        <path
                                          fillRule="evenodd"
                                          d="M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z"
                                          clipRule="evenodd"
                                        />
                                      </svg>
                                    ),
                                    desc: (
                                      <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        className="absolute h-5 w-5 text-blue-500"
                                        viewBox="0 0 20 20"
                                        fill="currentColor"
                                      >
                                        <path
                                          fillRule="evenodd"
                                          d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                          clipRule="evenodd"
                                        />
                                      </svg>
                                    ),
                                  }[header.column.getIsSorted()] ?? null}
                                </div>
                              </div>
                            </div>
                          )}
                        </th>
                      ))}
                    </tr>
                  ))}
                </thead>
                <tbody className="w-full">
                  {table.getRowModel().rows.map((row) => (
                    <tr
                      className="h-16 border-b border-t border-gray-700 text-sm leading-none text-gray-300 hover:bg-gray-900"
                      key={row.id}
                    >
                      {row.getVisibleCells().map((cell) => (
                        <td
                          className="cursor-pointer text-sm font-medium leading-none text-gray-300"
                          key={cell.id}
                        >
                          {flexRender(
                            cell.column.columnDef.cell,
                            cell.getContext()
                          )}
                        </td>
                      ))}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
          {data && (
            <span className="flex items-center justify-center gap-2 pt-8 pb-16">
              {[0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((pageSize) => (
                <button
                  className={`${
                    pageSize === pageIndex && `bg-gray-200 text-[#202026]`
                  } rounded bg-[#202026] px-5 py-4 text-center text-xs text-white transition duration-150 ease-in-out hover:bg-gray-200 hover:text-[#202026] focus:outline-none`}
                  onClick={() => {
                    table.setPageIndex(pageSize)
                    setPageIndex(pageSize)
                    window.scrollTo({ top: 0, left: 0, behavior: 'smooth' })
                  }}
                >
                  {console.log(pageIndex)}
                  {pageSize + 1}
                </button>
              ))}
            </span>
          )}
        </div>
      )}
    </div>
  )
}
