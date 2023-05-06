import { useQuery } from '@tanstack/react-query'
import LeaderboardAPI from '../apis/LeaderboardAPI'

const fetchLeaderboardRegion = ({ queryKey }) => {
  const region = queryKey[1]
  return LeaderboardAPI.get(`/${region}`)
}

export const useLeaderboardRegions = (region) => {
  return useQuery(['pepega', region], fetchLeaderboardRegion)
}
