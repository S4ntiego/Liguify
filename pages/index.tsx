import Search from '../components/Search'
import { useEffect, useContext } from 'react'
import { ChampionsContext } from '../context/ChampionsContext'

const Home = () => {
  const { setActiveTab } = useContext(ChampionsContext)

  useEffect(() => {
    setActiveTab(1)
  }, [])

  return (
    <div>
      <Search />
    </div>
  )
}

export default Home
