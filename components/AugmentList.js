import React from 'react'
import Image from 'next/image'
import { useEffect, useState } from 'react'
import {
  createColumnHelper,
  flexRender,
  getCoreRowModel,
  getSortedRowModel,
  getFilteredRowModel,
  useReactTable,
} from '@tanstack/react-table'
import AugmentsList from '../apis/AugmentsList'

export function AugmentList() {
  const [data, setData] = useState()
  const [sorting, setSorting] = useState()
  const [globalFilter, setGlobalFilter] = useState('')

  const columnHelper = createColumnHelper()

  const columns = React.useMemo(
    () => [
      columnHelper.accessor('augment_name', {
        header: () => <div className="pl-4 text-left">Augment</div>,
        cell: (info) => (
          <div className="flex items-center pl-4">
            <div className="relative h-10 w-10">
              <Image
                className="rounded"
                layout="fill"
                objectFit="cover"
                src={`https://liguify.s3.us-west-004.backblazeb2.com/augments/${info.row.original.augment_api_name}.png`}
              />
            </div>
            <div className="pl-4">
              <p className="font-medium">{info.getValue()}</p>
            </div>
          </div>
        ),
      }),
      columnHelper.accessor('average_placement', {
        cell: (info) => (
          <div className="pl-4 text-center">{info.getValue()}</div>
        ),
        header: () => <div className="pl-4">Average Placement</div>,
      }),
      columnHelper.accessor('win_ratio', {
        header: () => <div className="pl-10">Win Ratio</div>,
        cell: (info) => (
          <div className="pl-10 text-center">{info.renderValue()}%</div>
        ),
      }),
      columnHelper.accessor('percentage_frequency', {
        cell: (info) => (
          <div className="pl-10 text-center">{info.getValue()}%</div>
        ),
        header: () => <div className="pl-10">Play Ratio Per Player</div>,
      }),
      columnHelper.accessor('frequency', {
        cell: (info) => (
          <div className="pl-10 pr-4 text-right">{info.getValue()}</div>
        ),
        header: () => <div className="pl-10 pr-4 text-right">Frequency</div>,
      }),
    ],
    []
  )

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await AugmentsList.get()

        setData(response.data.data.augments)
      } catch (err) {
        console.log(err)
      }
    }

    fetchData()
  }, [])

  const table = useReactTable({
    data,
    columns,
    state: {
      sorting,
      globalFilter,
    },
    getFilteredRowModel: getFilteredRowModel(),
    onSortingChange: setSorting,
    getSortedRowModel: getSortedRowModel(),
    getCoreRowModel: getCoreRowModel(),
    debugTable: true,
  })

  return (
    <div className="flex flex-col justify-center px-4 pt-4 shadow md:px-10 md:pt-4">
      {data && (
        <div className="flex justify-center">
          <div className="my-2 flex h-12 w-full flex-row items-center rounded bg-[#202026] px-4 lg:max-w-[452px]">
            <svg
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
            <input
              value={globalFilter ?? ''}
              onChange={(e) => setGlobalFilter(e.target.value)}
              className="h-12 w-full bg-[#202026] px-4 text-sm text-gray-200 outline-none lg:max-w-[452px]"
              placeholder="Search Augment"
            />
          </div>
        </div>
      )}
      {data && (
        <div className="flex justify-center">
          <table className="w-full">
            <thead>
              {table.getHeaderGroups().map((headerGroup) => (
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
                            onClick: header.column.getToggleSortingHandler(),
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
            <tfoot>
              {table.getFooterGroups().map((footerGroup) => (
                <tr key={footerGroup.id}>
                  {footerGroup.headers.map((header) => (
                    <th key={header.id}>
                      {header.isPlaceholder
                        ? null
                        : flexRender(
                            header.column.columnDef.footer,
                            header.getContext()
                          )}
                    </th>
                  ))}
                </tr>
              ))}
            </tfoot>
          </table>
        </div>
      )}
      <div className="h-4" />
    </div>
  )
}

function Filter({ column, table }) {
  const firstValue = table
    .getPreFilteredRowModel()
    .flatRows[0]?.getValue(column.id)

  return typeof firstValue === 'number' ? (
    <div className="flex space-x-2">
      <input
        type="number"
        value={column.getFilterValue()?.[0] ?? ''}
        onChange={(e) =>
          column.setFilterValue((old) => [e.target.value, old?.[1]])
        }
        placeholder={`Min`}
        className="w-24 rounded border shadow"
      />
      <input
        type="number"
        value={column.getFilterValue()?.[1] ?? ''}
        onChange={(e) =>
          column.setFilterValue((old) => [old?.[0], e.target.value])
        }
        placeholder={`Max`}
        className="w-24 rounded border shadow"
      />
    </div>
  ) : (
    <input
      type="text"
      value={column.getFilterValue() ?? ''}
      onChange={(e) => column.setFilterValue(e.target.value)}
      placeholder={`Search...`}
      className="w-36 rounded border shadow"
    />
  )
}
