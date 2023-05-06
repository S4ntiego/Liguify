import Link from 'next/link'
import React, { useContext } from 'react'
import { ChampionsContext } from '../context/ChampionsContext'

const Navbar = () => {
  const { activeTab, setActiveTab } = useContext(ChampionsContext)

  return (
    <header className="shadow-b sticky top-0 z-20 bg-[#202026] px-16 py-4 shadow-xl">
      <div className="flex justify-between">
        {/* LOGO */}
        <div className="flex flex-row items-center">
          <Link href="/">
            <a className="cursor-pointer">
              <span className="pt-1 font-rubik text-xl font-bold tracking-tight text-gray-100">
                LIGUIFY
              </span>
            </a>
          </Link>
        </div>
        {/* MIDDLE MENU ITEMS */}
        <ul className="flex flex-row items-center">
          {/* FIRST ITEM */}
          <li
            className={
              activeTab === 1
                ? 'text-sm text-gray-200'
                : 'cursor-pointer text-sm text-gray-500 hover:text-gray-200'
            }
          >
            <div className="relative flex items-center">
              <Link href="/">Home</Link>
              {activeTab === 1 && (
                <div className="absolute mt-[55px] h-1 w-full rounded bg-gray-200" />
              )}
            </div>
          </li>
          {/* SECOND ITEM */}
          <li
            className={
              activeTab === 2
                ? 'text-sm text-gray-200'
                : 'cursor-pointer text-sm text-gray-500 hover:text-gray-200'
            }
          >
            <div className="relative ml-8 flex items-center">
              <Link href="/teamcomps">Team Comps</Link>
              {activeTab === 2 && (
                <div className="absolute mt-[55px] h-1 w-full rounded bg-gray-200" />
              )}
            </div>
          </li>
          {/* THIRD ITEM WITH MENU */}
          <li
            onClick={() => setActiveTab(3)}
            className={`${
              activeTab === 3
                ? 'text-sm text-gray-200'
                : 'cursor-pointer text-sm text-gray-500 hover:text-gray-200'
            } dropdown group relative`}
          >
            <div className="flex items-center">
              <Link href="/champions">
                <a className="ml-8">Statistics</a>
              </Link>
              {activeTab === 3 && (
                <div className="absolute left-4 mt-[53px] h-1 w-full rounded bg-gray-200" />
              )}
            </div>
            <div className="dropdown-menu absolute ml-4 hidden rounded bg-[#202026] group-hover:block">
              <ul className="top-0 flex w-36 flex-col gap-y-4 px-4 pt-8 pb-4">
                <Link href="/champions">
                  <li className="font-sm block cursor-pointer text-gray-500 hover:text-gray-200">
                    Champions
                  </li>
                </Link>
                <Link href="/items">
                  <li className="font-sm block cursor-pointer text-gray-500 hover:text-gray-200">
                    Items
                  </li>
                </Link>
                <Link href="/augments">
                  <li className="font-sm block cursor-pointer text-gray-500 hover:text-gray-200">
                    Augments
                  </li>
                </Link>
              </ul>
            </div>
          </li>
          {/* FOURTH ITEM */}
          <li
            onClick={() => setActiveTab(4)}
            className={
              activeTab === 4
                ? 'text-sm text-gray-200'
                : 'cursor-pointer text-sm text-gray-500 hover:text-gray-200'
            }
          >
            <div className="relative ml-8 flex items-center">
              <Link href="/leaderboard">Leaderboard</Link>
              {activeTab === 4 && (
                <div className="absolute mt-[55px] h-1 w-full rounded bg-gray-200" />
              )}
            </div>
          </li>
        </ul>
        <div className="flex flex-row items-center">
          <Link href="/">
            <a className="cursor-pointer">
              <span className="pt-1 font-rubik text-xl font-bold tracking-tight text-gray-100">
                LIGUIFY
              </span>
            </a>
          </Link>
        </div>
      </div>
    </header>
  )
}

export default Navbar
