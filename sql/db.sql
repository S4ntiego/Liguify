-- help \?
-- new database CREATE DATABASE database_name;
-- list of databases \l
-- connect to other database \c database_name
-- list tables \d
-- list columns and types \d database_name
-- \q leave psql command line
-- \d view detailed info about tables
-- \dt view short info about tables

CREATE TABLE products (
    id INT,
    name VARCHAR(50),
    price INT,
    on_sale BOOLEAN
);

ALTER TABLE products ADD COLUMN featured BOOLEAN;
ALTER TABLE products DROP COLUMN featured;

CREATE TABLE restaurants (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    price_range INT NOT NULL check(price_range >= 1 and price_range <= 5)
);

INSERT INTO restaurants (id, name, location, price_range) values (123, 'McDonalds', 'New York', 3);

INSERT INTO restaurants (name, location, price_range) values ('wendys', 'new york', 12);

example_query RETURNING * -> zwraca nowy wpis do bazy danych

UPDATE restaurants SET name = 'red lobster', location = 'miami', price_range = 2 WHERE id = 3;

DELETE FROM restaurants WHERE id = 8

CREATE TABLE reviews (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    restaurant_id BIGINT NOT NULL REFERENCES restaurants(id), 
    name VARCHAR(50) NOT NULL,
    review TEXT NOT NULL,
    rating INT NOT NULL check(rating >=1 and rating <= 5)
);

INSERT INTO reviews (restaurant_id, name, review, rating) values (2, 'Steve', 'Restaurant was great', '4');

SELECT MAX(rating) FROM reviews
SELECT COUNT(*) FROM reviews
SELECT TRUNC(AVG(rating), 2) AS average_review FROM reviews

SELECT name as username, rating as restaurant_rating FROM reviews
SELECT AVG(rating) FROM reviews WHERE restaurant_id = 1

SELECT * FROM restaurants INNER JOIN reviews ON restaurants.id = reviews.restaurant_id

SELECT * FROM restaurants LEFT JOIN (SELECT restaurant_id, COUNT(*), TRUNC(AVG(rating), 1) AS average_rating FROM reviews GROUP BY restaurant_id) reviews ON restaurants.id = reviews.restaurant_id;

CREATE TABLE units (
    character_id BIGSERIAL NOT NULL PRIMARY KEY,
    unit VARCHAR(50) NOT NULL,
    origin_id INT[] REFERENCES origins(origin_id)
    class_id INT[] REFERENCES classes(class_id),
    tier INT,
    health INT[],
    armor INT[],
    magic_resist INT[],
    energy INT[],
    mana INT[],
    attack_speed INT[],
    attack_damage INT[],
    range INT[],
    damage_per_second INT[],
    critical_strike_chance INT[],
    resource INT[]
);

CREATE TABLE origins (
    origin_id BIGSERIAL NOT NULL PRIMARY KEY,
    origin VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    tiers INT[],
    bonuses TEXT[]
);

CREATE TABLE classes (
    class_id BIGSERIAL NOT NULL PRIMARY KEY,
    class VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    tiers INT[],
    bonuses TEXT[]
);

INSERT INTO origins (origin, description, tiers, bonuses) values ('Astral', 'Every 5th Shop has increased odds to show Astral champions, and also grants an Astral orb. Your team gains bonus Ability Power.', ARRAY  [3,6,9], ARRAY
['10 Ability Power', '20 Ability Power, Orb value increases', '50 Ability Power, Orbs may contain components']);

CREATE TABLE origins2 (
    origin_id BIGSERIAL NOT NULL PRIMARY KEY,
    origin VARCHAR(50) NOT NULL,
    origin_description TEXT NOT NULL,
    tier INT,
    bonus TEXT
);

CREATE TABLE tiers (
    tier_id BIGSERIAL NOT NULL PRIMARY KEY,
    tier INT NOT NULL
);

CREATE TABLE originsbonuses (
    originbonus_id BIGSERIAL NOT NULL PRIMARY KEY,
    originbonus_description TEXT NOT NULL,
    origin_tier_id BIGINT NOT NULL REFERENCES tiers(tier_id)
);

CREATE TABLE origin_tier_originbonus (
    origin_id INT REFERENCES origins2(origin_id),
    tier_id INT REFERENCES tiers(tier_id),
    originbonus_id INT REFERENCES originsbonuses(originbonus_id),
    CONSTRAINT origin_tier_originbonus_pkey PRIMARY KEY (origin_id, tier_id, originbonus_id)
);

INSERT INTO originsbonuses (originbonus_description, origin_tier_id) VALUES ('10 Ability Power', 3);
INSERT INTO origin_tier_originbonus (origin_id, tier_id, originbonus_id) VALUES (

    ---

    CREATE TABLE classes (
    class_id SERIAL NOT NULL PRIMARY KEY,
    class VARCHAR(255),
    class_description TEXT,
    special_effect TEXT
);



CREATE TABLE class_bonus (
    class_bonus_id SERIAL NOT NULL PRIMARY KEY,
    class_id INTEGER,
    tier INTEGER,
    bonus_description TEXT
);

CREATE TABLE origin_bonus (
    origin_bonus_id SERIAL NOT NULL PRIMARY KEY,
    origin_id INTEGER,
    tier INTEGER,
    bonus_description TEXT
);

CREATE TABLE components (
    component_id SERIAL NOT NULL PRIMARY KEY,
    component VARCHAR(255),
    component_description text,
    component_statistic_1 VARCHAR(255),
    component_statistic_2 VARCHAR(255)
);

CREATE TABLE recipes (
    recipe_id SERIAL NOT NULL,
    item_id INT NOT NULL,
    component_id INT NOT NULL,
    PRIMARY KEY(recipe_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id),
    FOREIGN KEY (component_id) REFERENCES components(component_id)
);

CREATE TABLE summoners (
    account_id SERIAL NOT NULL PRIMARY KEY,
    summoner_id 
    puuid,
    summoner_name,
    revisionDate,
    summoner_level,
    tier text,
);

CREATE TABLE matches (
    match_id VARCHAR(255) NOT NULL PRIMARY KEY,
    tft_game_type VARCHAR(64),
    tft_set_number SMALLINT,
    tft_set_core_name VARCHAR(128),
    queue_id INT,
    game_datetime BIGINT,
    game_length NUMERIC(20),
    game_version VARCHAR(512),
    data_version SMALLINT
);

CREATE TABLE summoners (
    id SERIAL NOT NULL UNIQUE PRIMARY KEY,
    puuid VARCHAR(255) UNIQUE,
    accountId VARCHAR(255) UNIQUE,
    summonerName VARCHAR(64),
    profileIconId INTEGER,
    summonerId VARCHAR(255) UNIQUE,
    revisionDate BIGINT,
    summonerLevel INTEGER
);

CREATE TABLE summonersLeague (
    id SERIAL NOT NULL UNIQUE PRIMARY KEY,
    summonerId VARCHAR(255) UNIQUE,
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

CREATE TABLE xD (
    summoner_puuid VARCHAR(255) REFERENCES summoners(puuid) ON UPDATE CASCADE ON DELETE CASCADE,
    match_id VARCHAR(255) REFERENCES matches(match_id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT summoner_match_pkey PRIMARY KEY (summoner_id, match_id)
);

CREATE TABLE summoners_matches (
  summoner_puuid VARCHAR(255) NOT NULL,
  match_id VARCHAR(255) NOT NULL,
  placement INT,
  gold_left INT,
  last_round INT,
  summoner_level INT,
  players_eliminated INT,
  time_eliminated NUMERIC(20),
  total_damage_to_players INT,
  PRIMARY KEY (summoner_puuid, match_id),
  FOREIGN KEY (summoner_puuid) REFERENCES summoners(puuid) ON UPDATE CASCADE,
  FOREIGN KEY (match_id) REFERENCES matches(match_id) ON UPDATE CASCADE
);

    CREATE TABLE origins (
    origin_id SERIAL NOT NULL PRIMARY KEY,
    origin VARCHAR(255),
    origin_description TEXT
);

CREATE TABLE origins_effects (
    origin_id INTEGER NOT NULL,
    champions INTEGER,
    effect VARCHAR(256),
    CONSTRAINT fk_origin_id FOREIGN KEY (origin_id) REFERENCES origins (origin_id)
);

CREATE TABLE summoners (accountId VARCHAR(255), id NOT NULL PRIMARY KEY VARCHAR(255), summonerName VARCHAR(64), profileIconId INTEGER, puuid VARCHAR(255), revisionDate BIGINT, summonerLevel INTEGER);

INSERT INTO items (item, item_description, special_effect, variant, statistic_1, statistic_2) values ('Zeke''s Herald', 'Combat start: grant 30% Attack Speed to the holder and 2 adjacent allies in the same row.', 'Aura item', 'Normal', '10 Attack Damage', '150 Health');
INSERT INTO components (component, component_description, component_statistic_1) values ('Giant''s Belt', '150 Health.', '150 Health');
INSERT INTO components (component, component_description, component_statistic_1) values ('B.F. Sword', '10 Attack Damage.', '10 Attack Damage');

SELECT component FROM components as c INNER JOIN recipes AS r ON r.component_id = c.component_id INNER JOIN items AS i ON i.item_id = r.item_id;
SELECT component FROM components as c INNER JOIN recipes AS r ON r.component_id = c.component_id INNER JOIN items AS i ON i.item_id = r.item_id WHERE
i.item = 'Zeke''s Herald' ;

INSERT INTO origins (origin, origin_description) values ('Astral', 'Every 5th Shop has increased odds to show Astral champions, and also grants an Astral orb. Your team gains bonus Ability Power.');

INSERT INTO origins_effects (origin_id, champions, effect) values (1, 3, '5 Ability Power');
INSERT INTO origins_effects (origin_id, champions, effect) values (1, 6, '30 Ability Power, Orb value increases');
INSERT INTO origins_effects (origin_id, champions, effect) values (1, 9, '70 Ability Power, Orbs may contain components');

ALTER TABLE match_participant_champion ADD COLUMN champion_name 

