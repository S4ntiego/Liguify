    CREATE TABLE champions (
    id SERIAL NOT NULL UNIQUE,
    champion_cost INTEGER,
    champion_name VARCHAR(64) UNIQUE,
    champion_api_name VARCHAR(64) UNIQUE,
    origin_first VARCHAR(64) REFERENCES origins (origin_name),
    origin_second VARCHAR(64) REFERENCES origins (origin_name),
    trait_first VARCHAR(64) REFERENCES traits (trait_name),
    trait_second VARCHAR(64) REFERENCES traits (trait_name),
    origin_quantity SMALLINT
);

INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (1, 'Aatrox', 'Aatrox');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (1, 'Ezreal', 'Ezreal');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (1, 'Heimerdinger', 'Heimerdinger');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (1, 'Karma', 'Karma');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (1, 'Leona', 'Leona');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (1, 'Nidalee', 'Nidalee');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (1, 'Sejuani', 'Sejuani');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (1, 'Senna', 'Senna');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (1, 'Sett', 'Sett');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (1, 'Skarner', 'Skarner');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (1, 'Tahm Kench', 'TahmKench');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (1, 'Taric', 'Taric');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (1, 'Vladimir', 'Vladimir');

INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (2, 'Ashe', 'Ashe');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (2, 'Braum', 'Braum');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (2, 'Gnar', 'Gnar');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (2, 'Jinx', 'Jinx');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (2, 'Kayn', 'Kayn');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (2, 'Lillia', 'Lillia');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (2, 'Nami', 'Nami');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (2, 'Qiyana', 'Qiyana');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (2, 'Shen', 'Shen');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (2, 'Thresh', 'Thresh');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (2, 'Tristana', 'Tristana');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (2, 'Twitch', 'Twitch');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (2, 'Yone', 'Yone');

INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (3, 'Anivia', 'Anivia');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (3, 'Diana', 'Diana');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (3, 'Elise', 'Elise');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (3, 'Illaoi', 'Illaoi');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (3, 'Lee Sin', 'LeeSin');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (3, 'Lulu', 'Lulu');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (3, 'Nunu & Willump', 'Nunu');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (3, 'Olaf', 'Olaf');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (3, 'Ryze', 'Ryze');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (3, 'Swain', 'Swain');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (3, 'Sylas', 'Sylas');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (3, 'Varus', 'Varus');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (3, 'Volibear', 'Volibear');

INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (4, 'Corki', 'Corki');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (4, 'Hecarim', 'Hecarim');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (4, 'Neeko', 'Neeko');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (4, 'Ornn', 'Ornn');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (4, 'Sona', 'Sona');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (4, 'Talon', 'Talon');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (4, 'Xayah', 'Xayah');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (4, 'Daeja', 'DragonBlue');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (4, 'Idas', 'DragonGold');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (4, 'Shi Oh Yu', 'DragonGreen');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (4, 'Sy''fen', 'DragonPurple');

INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (5, 'Bard', 'Bard');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (5, 'Pyke', 'Pyke');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (5, 'Soraka', 'Soraka');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (5, 'Yasuo', 'Yasuo');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (5, 'Zoe', 'Zoe');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (5, 'Ao Shin', 'AoShin');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (5, 'Aurelion Sol', 'AurelionSol');
INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (5, 'Shyvana', 'Shyvana');

INSERT INTO champions (champion_cost, champion_name, champion_api_name) values (8, 'Nomsy', 'TrainerDragon');