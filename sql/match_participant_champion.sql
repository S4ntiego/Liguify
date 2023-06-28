CREATE TABLE match_participant_champion (
    match_id VARCHAR(255) REFERENCES matches (match_id),
    puuid VARCHAR(255) REFERENCES summoners (puuid),
    champion_api_name VARCHAR(64) REFERENCES champions (champion_api_name),
    rarity INTEGER,
    tier INTEGER,
    CONSTRAINT pk_match_participant_champion PRIMARY KEY (match_id, puuid, champion_api_name)
);

play rate in average game -> SELECT champion_api_name, (COUNT(champion_api_name)/(SELECT reltuples FROM pg_class WHERE relname='match_participant_champion')/8) FROM match_participant_champion GROUP BY champion_api_name;
top1 count -> SELECT champion_api_name, COUNT(placement) FROM match_participant INNER JOIN match_participant_champion USING (match_id, puuid) GROUP BY champion_api_name, placement HAVING placement=1;