    CREATE TABLE origins (
    origin_id SERIAL NOT NULL UNIQUE PRIMARY KEY,
    origin_name VARCHAR(255) UNIQUE,
    origin_description TEXT
);

CREATE TABLE origins_effects (
    origin_id INTEGER NOT NULL,
    champions INTEGER,
    effect VARCHAR(256),
    style INTEGER,
    CONSTRAINT fk_origin_id FOREIGN KEY (origin_id) REFERENCES origins (origin_id)
);

-- Astral

INSERT INTO origins (origin_name, origin_description) values ('Astral', 'Every 5th Shop has increased odds to show Astral champions, and also grants an Astral orb. 

Your team gains bonus Ability Power.');

INSERT INTO origins_effects (origin_id, champions, effect, style) values (1, 3, '5 Ability Power', 1);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (1, 6, '30 Ability Power, Orb value increases', 2);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (1, 9, '70 Ability Power, Orbs may contain components', 3);

-- Guild

INSERT INTO origins (origin_name, origin_description) values ('Guild', 'Grant a unique bonus to your team; Guild members gain double the amount. Increases for each Guild member in play!

Sejuani: +100 Health

Twitch: +10% Attack Speed

Ryze: +10 Ability Power

Talon: +10 Attack Damage

Bard: +2 Mana per attack

Emblem: +3% Omnivamp (healing for a percentage of damage dealt)');

INSERT INTO origins_effects (origin_id, champions, effect, style) values (2, 1, '100% Guild bonus', 1);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (2, 2, '120% Guild bonus', 1);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (2, 3, '140% Guild bonus', 2);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (2, 4, '160% Guild bonus', 2);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (2, 5, '180% Guild bonus', 3);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (2, 6, '200% Guild bonus', 4);

-- Jade

INSERT INTO origins (origin_name, origin_description) values ('Jade', 'Summon movable Jade Statues that grow in power.

Each combat, allies adjacent to a statue gain Attack Speed and maximum Health healing every 2 seconds. When a statue is destroyed, it deals 33% of its Health as magic damage to nearby enemies.');

INSERT INTO origins_effects (origin_id, champions, effect, style) values (3, 3, '1 statue, +2% healing, +20% Attack Speed', 1);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (3, 6, '2 statues, +5% healing, +40% Attack Speed', 2);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (3, 9, '3 statues, +8% healing, +60% Attack Speed', 3);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (3, 12, '4 statues, +25% healing, +100% Attack Speed', 4);

-- Mirage

INSERT INTO origins (origin_name, origin_description) values ('Mirage', 'Mirage champions gain a different Trait bonus from game to game.

Electric Overload: When attacking or being hit by an attack, gain a chance to deal 8% of their maximum Health as magic damage to adjacent enemies.

Warlord''s Honor: After winning any combat, gain bonus Health and Ability Power. Increases by 10% per win, stacks up to 5 times!

Pirate''s Greed: Gain a chest of loot after each player combat.

Dawnbringer''s Determination: Once per combat, rapidly heal at 50% Health.

Executioner''s Edge: Always critically strike low Heath targets with Attacks and Abilities. Gain bonus Critial Strike Damage.

Spellsword''s Enchantment: Each player combat, gain Ability Power per attack.

Duelist''s Dexterity: Innate: Mirage units move faster. Attacks grant bonus Attack Speed, up to 10 stacks.');

INSERT INTO origins_effects (origin_id, champions, effect, style) values (4, 2, 'Selected randomly each game', 1);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (4, 4, 'Selected randomly each game', 2);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (4, 6, 'Selected randomly each game', 3);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (4, 8, 'Selected randomly each game', 4);

-- Ragewing

INSERT INTO origins (origin_name, origin_description) values ('Ragewing', 'Innate: Convert Mana to Rage; attacks generate 15 Rage. After casting an Ability, enrage for 4 seconds: +25% Attack Speed but can''t gain Rage.

Gain bonus stats when enraged');

INSERT INTO origins_effects (origin_id, champions, effect, style) values (5, 3, '50% Attack Speed, 30% Omnivamp', 1);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (5, 6, '150% Attack Speed, 50% Omnivamp', 2);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (5, 9, '250% Attack Speed, 70% Omnivamp', 3);

-- Revel

INSERT INTO origins (origin_name, origin_description) values ('Revel', 'After dealing damage with an Ability, launch a firecracker that deals magic damage to a random enemy.');

INSERT INTO origins_effects (origin_id, champions, effect, style) values (6, 2, '140 magic damage', 1);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (6, 3, '170 magic damage', 2);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (6, 4, '225 magic damage', 3);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (6, 5, '300 magic damage', 4);

-- Scalescorn

INSERT INTO origins (origin_name, origin_description) values ('Scalescorn', 'If you don''t have a Dragon on your team, Scalescorn champions deal bonus magic damage and take 25% reduced damage from enemies with more than 2200 Health.');

INSERT INTO origins_effects (origin_id, champions, effect, style) values (7, 2, '15% magic damage', 1);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (7, 4, '50% magic damage', 2);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (7, 6, '100% magic damage', 3);

-- Shimmerscale

INSERT INTO origins (origin_name, origin_description) values ('Shimmerscale', 'Grant exclusive random Shimmerscale items.');

INSERT INTO origins_effects (origin_id, champions, effect, style) values (8, 3, '1 unique item', 1);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (8, 5, '2 unique items', 2);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (8, 7, '4 unique items', 3);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (8, 9, '5 unique items, which includes Crown of Champions', 4);

-- Tempest

INSERT INTO origins (origin_name, origin_description) values ('Tempest', 'After 8 seconds, lightning strikes that battlefield. Enemies are stunned for 1 second and take a percent of their maximum Health as true damage. Tempest champions gaian Attack Speed.');

INSERT INTO origins_effects (origin_id, champions, effect, style) values (9, 2, '10% damage, 25% Attack Speed', 1);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (9, 4, '20% damage, 50% Attack Speed', 2);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (9, 6, '30% damage, 80% Attack Speed', 3);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (9, 8, '45% damage, 150% Attack Speed', 4);

-- Trainer

INSERT INTO origins (origin_name, origin_description) values ('Trainer', 'Every round, each Trainer feeds 1 Snax per star level to Nomsy, adding Health and Ability Power. Nomsy''s star level increases every 25 Snax!');

INSERT INTO origins_effects (origin_id, champions, effect, style) values (10, 2, 'Summon Nomsy!', 1);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (10, 3, 'Nomsy''s Ability deals 100% more damage.', 3);

-- Whispers

INSERT INTO origins (origin_name, origin_description) values ('Whispers', 'Whispers damage shrinks enemies, reducing their Armor and Magic Resist by 40% for 6 seconds.

When they damage a shrunken enemy, Whispers gain stacking bonuses');

INSERT INTO origins_effects (origin_id, champions, effect, style) values (11, 2, '1 Attack Damage and Ability Power', 1);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (11, 4, '3 Attack Damage and Ability Power', 2);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (11, 6, '5 Attack Damage and Ability Power', 3);
INSERT INTO origins_effects (origin_id, champions, effect, style) values (11, 8, '8 Attack Damage and Ability Power', 4);






