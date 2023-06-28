CREATE TABLE fetchTimestamp (
    id SERIAL NOT NULL UNIQUE PRIMARY KEY,
    fetched_at TIMESTAMP,
    matchRegion VARCHAR(24),
    matchRanking VARCHAR (16)
);