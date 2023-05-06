<img src="https://user-images.githubusercontent.com/62663595/236618014-3ef70e2a-6aae-4acf-a320-6d54b93edf27.jpg" />

Please note that the data for this project was collected during season 7 of the Teamfight Tactics game around the summer of 2022. Due to the complete obsolescence of data resulting from the game update system, and the lack of plans to commercialize the application, its "live" version is not available. Nevertheless, the existing code may be a great starting point for a new project as the game-related data can be fetched directly from the Data Dragon API created by the community, or manually updated locally before gathering fresh summoners and match data from the current season.

The site is in the early stages of development and focuses primarily on data analysis, SQL queries, and database structure. Therefore, as of today, styling is only provided in the desktop version.

# Liguify

This is a full-stack website created to analyze Teamfight Tactics game data collected via the Riot API. The main goal of creating this website was to learn complex SQL queries, data analysis, and database architecture. I have gathered locally data regarding more than 11,000 matches and 90,000 team compositions to present the results visible on the screenshoots.

# Folder structure

- CLIENT

  - apis: BaseURLs for fetching data with axios

  - components

  - context: Fetched data and active tabs

  - hooks: Hook for fetching the relevant region for the leaderboard

  - pages: The routing system

- SERVER

  - db: The Knex configuration

  - functions: API functions that split the received data and insert it into the appropriate tables & an additional function that delays calls to comply with the basic tier of the Riot API

  - tasks: Planned cron job folder to automate data gathering at certain intervals

  - index: TAPI points to call the functions with requested parameters

- SQL

  - SELECTS: Most of the used queries used to analyze the gathered data

  - Others: Tables, delete functions, and inserts of the game-related data

# Libraries/Technology used in the project:

The following libraries and technologies were used in the project:

- Next.js 13
- React
- Knex Query Builder (pure PostgreSQL queries)
- PostgreSQL database
- Express
- React-query
- React-table
- Tailwind CSS
- Riot API
- Backblaze

# Features

The website has the following features:

- Data analysis based on over 11,000 matches and 90,000 team compositions
- Complex SQL queries, temporary tables, and relationships
- Live and historical data (match history of a given summoner, team compositions, augments, items, etc.)
- Queries built with Knex.js
- Routing/Layouts - Next.js 13
- React Table with sorting, search, and filters
- React Memo and Context
- Database - local PostgreSQL run with PgAdmin 4 & Postgres.app
- Stylization - Tailwind CSS (as of today, the website is not yet responsive, and only the desktop version is available)

# Running locally

To run the project, you need to:

- Create and update the relevant tables provided in the SQL folder to match the current state of the game.
- Update the Riot API fetching functions provided in the server -> functions folder to match the current state of the Riot API.
- Fetch fresh data to display it on the client.
- Provide the following .env files:

  a) PostgreSQL related (local PG database or hosted on, e.g., Railway or DigitalOcean):

  - PGUSER
  - PGHOST
  - PGPASSWORD
  - PGDATABASE
  - PGPORT

  b) Other:

  - RIOT_API_KEY: available at https://developer.riotgames.com/
  - PORT: (insert local port for nodemon)

# Gallery

<div style={{'display':'flex'}}>
<img src="https://user-images.githubusercontent.com/62663595/236618002-6f424b8b-6f0a-4cad-a4e2-cb165a18f3dd.jpg" />
<img src="https://user-images.githubusercontent.com/62663595/236618014-3ef70e2a-6aae-4acf-a320-6d54b93edf27.jpg" />
<img src="https://user-images.githubusercontent.com/62663595/236618029-2caadac2-124e-4523-8a11-1af72185dd88.jpg" />
<img src="https://user-images.githubusercontent.com/62663595/236618052-e04eafa8-e9f2-46b0-bdf6-f56b1dbbc316.jpg" />
<img src="https://user-images.githubusercontent.com/62663595/236618057-0e0e5578-a5ad-43ec-8a00-9e8cabacf07e.jpg" />
<img src="https://user-images.githubusercontent.com/62663595/236618062-18121ad0-533f-4ed0-9096-73993ca9630f.jpg" />
</div>
