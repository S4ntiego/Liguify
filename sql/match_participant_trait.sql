CREATE TABLE match_participant_trait (
    match_id VARCHAR(255) REFERENCES matches (match_id),
    puuid VARCHAR(255) REFERENCES summoners (puuid),
    trait_name VARCHAR(64) REFERENCES traits (trait_name),
    num_units INTEGER,
    style INTEGER,
    tier_current INTEGER,
    tier_total INTEGER,
    CONSTRAINT pk_match_participant_trait PRIMARY KEY (match_id, puuid, trait_name)
);