import React, { useState, createContext } from 'react'

export const ChampionsContext = createContext()

export const ChampionsContextProvider = (props) => {
  const [data, setData] = useState()
  const [champions, setChampions] = useState([])
  const [selectedChampion, setSelectedChampion] = useState(null)
  const [activeTab, setActiveTab] = useState(1)
  const [activeRegion, setActiveRegion] = useState(1)
  const [teamcompsData, setTeamcompsData] = useState()

  return (
    <ChampionsContext.Provider
      value={{
        data,
        setData,
        champions,
        setChampions,
        selectedChampion,
        setSelectedChampion,
        activeTab,
        setActiveTab,
        activeRegion,
        setActiveRegion,
        teamcompsData,
        setTeamcompsData,
      }}
    >
      {props.children}
    </ChampionsContext.Provider>
  )
}
