import '../styles/globals.css'
import '@fortawesome/fontawesome-svg-core/styles.css' // import Font Awesome CSS
import { config } from '@fortawesome/fontawesome-svg-core'
config.autoAddCss = false // Tell Font Awesome to skip adding the CSS automatically since it's being imported above
import Layout from '../components/Layout'
import { ChampionsContextProvider } from '../context/ChampionsContext'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
const queryClient = new QueryClient()

function MyApp({ Component, pageProps }) {
  return (
    <QueryClientProvider client={queryClient}>
      <ChampionsContextProvider>
        <Layout>
          <Component {...pageProps} />
        </Layout>
      </ChampionsContextProvider>
    </QueryClientProvider>
  )
}

export default MyApp
