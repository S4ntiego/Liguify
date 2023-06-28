CREATE TABLE summoners (
    id SERIAL NOT NULL UNIQUE PRIMARY KEY,
    puuid VARCHAR(255) UNIQUE,
    accountId VARCHAR(255) UNIQUE,
    summonerName VARCHAR(64),
    profileIconId INTEGER,
    summonerId VARCHAR(255) UNIQUE,
    revisionDate BIGINT,
    summonerLevel INTEGER,
    summonerRegion VARCHAR(24),
    fetched_at TIMESTAMP
);