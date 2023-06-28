CREATE TABLE matches (
    id SERIAL NOT NULL UNIQUE PRIMARY KEY,
    data_version SMALLINT,
    match_id VARCHAR(255) UNIQUE,
    game_datetime BIGINT,
    game_length NUMERIC(20),
    game_version VARCHAR(255),
    queue_id INTEGER,
    tft_game_type VARCHAR(64),
    tft_set_core_name VARCHAR(64),
    tft_set_number INTEGER,
    matchRegion VARCHAR(24),
    fetched_at TIMESTAMP,
    matchRanking VARCHAR (16)
);