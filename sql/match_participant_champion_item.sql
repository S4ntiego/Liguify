CREATE TABLE match_participant_champion_item (
    match_id VARCHAR(255) REFERENCES matches (match_id),
    puuid VARCHAR(255) REFERENCES summoners (puuid),
    champion_api_name VARCHAR(64) REFERENCES champions (champion_api_name),
    item_id VARCHAR(255) REFERENCES items (item_id),
    CONSTRAINT pk_match_participant_champion_item PRIMARY KEY (match_id, puuid, champion_api_name, item_id)
);