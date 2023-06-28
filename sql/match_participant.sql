CREATE TABLE match_participant (
    match_id VARCHAR(255) REFERENCES matches (match_id),
    puuid VARCHAR(255) REFERENCES summoners (puuid),
    gold_left INTEGER,
    last_round INTEGER,
    participant_level INTEGER,
    placement INTEGER,
    players_eliminated INTEGER,
    time_eliminated NUMERIC(20),
    total_damage_to_players INTEGER,
    CONSTRAINT pk_match_participant PRIMARY KEY (match_id, puuid)
);

SELECT * FROM match_participant INNER JOIN match_participant_augment ON match_participant.puuid = match_participant_augment.puuid WHERE match_participant.puuid='isYud7AsdGmMHVQd_bw0m3LrMD9NcYge8IMZZheac8UTncky1n0KgEb6n2jajdNfqGXPLGHn3IeRDA';

SELECT match_participant.placement, match_participant_augment.augment_api_name FROM match_participant INNER JOIN match_participant_augment ON match_participant.match_id = match_participant_augment.match_id AND match_participant.puuid = match_participant_augment.puuid WHERE match_participant.puuid='isYud7AsdGmMHVQd_bw0m3LrMD9NcYge8IMZZheac8UTncky1n0KgEb6n2jajdNfqGXPLGHn3IeRDA';