-- CREATE TABLE match_participant_augment (
--     id SERIAL UNIQUE NOT NULL PRIMARY KEY,
--     match_id VARCHAR(256) NOT NULL,
--     summoner_puuid VARCHAR(256) NOT NULL,
--     augment_api_name VARCHAR(256),
--     stage INTEGER,
--     CONSTRAINT pk_match_participant_augment PRIMARY KEY (id, match_id, augment_api_name),
--     CONSTRAINT fk_match_id FOREIGN KEY (match_id) REFERENCES matches (match_id),
--     CONSTRAINT fk_summoner_puuid FOREIGN KEY (summoner_puuid) REFERENCES summoners (puuid),
--     CONSTRAINT fk_augment_api_name FOREIGN KEY (augment_api_name) REFERENCES augments (augment_api_name)
-- );

--TESTOWA WERSJA

CREATE TABLE match_participant_augment (
    match_id VARCHAR(255) REFERENCES matches (match_id),
    puuid VARCHAR(255) REFERENCES summoners (puuid),
    augment_api_name VARCHAR(255) REFERENCES augments(augment_api_name),
    stage INTEGER,
    CONSTRAINT pk_match_participant_augment PRIMARY KEY (match_id, puuid, augment_api_name)
);