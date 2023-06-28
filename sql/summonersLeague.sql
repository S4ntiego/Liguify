CREATE TABLE summonersLeague (
    summonerId VARCHAR(255) UNIQUE REFERENCES summoners (summonerId),
    summonerName VARCHAR(64),
    leaguePoints INTEGER,
    summonerRank VARCHAR(16),
    wins INTEGER,
    losses INTEGER,
    veteran BOOLEAN,
    inactive BOOLEAN,
    freshBlood BOOLEAN,
    hotStreak BOOLEAN,
    leagueId VARCHAR (255),
    queueType VARCHAR (36),
    tier VARCHAR (16)
);

ALTER TABLE summonersLeague ADD COLUMN summonerRegion VARCHAR(24);