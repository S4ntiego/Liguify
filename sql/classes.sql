    CREATE TABLE classes (
    class_id SERIAL NOT NULL PRIMARY KEY,
    class_name VARCHAR(255),
    class_description TEXT
);

CREATE TABLE classes_effects (
    class_id INTEGER NOT NULL,
    champions INTEGER,
    effect VARCHAR(256),
    style INTEGER,
    CONSTRAINT fk_class_id FOREIGN KEY (class_id) REFERENCES classes (class_id)
);

-- Assassin

INSERT INTO classes (class_name, class_description) values ('Assassin', 'Innate: When combat starts, Assassins leap to the enemy backline.

Assassins'' Abilities can critically strike and they gain bonus Critical Strike Chance and bonus Critical Strike Damage.');

INSERT INTO classes_effects (class_id, champions, effect, style) values (1, 2, '15% Crit Chance & 15% Crit Damage', 1);
INSERT INTO classes_effects (class_id, champions, effect, style) values (1, 4, '30% Crit Chance & 30% Crit Damage', 3);
INSERT INTO classes_effects (class_id, champions, effect, style) values (1, 6, '45% Crit Chance & 50% Crit Damage', 4);

-- Bard

INSERT INTO classes (class_name, class_description) values ('Bard', '');

INSERT INTO classes_effects (class_id, champions, effect, style) values (2, 1, 'Allies that survive player combat have a 2% chance to create a Doot. Bard always creates a Doot when dancing.

Each Doot you collect increases your Shop odds for higher-tier champions by 1%.', 3);

-- Bruiser

INSERT INTO classes (class_name, class_description) values ('Bruiser', 'Your team gains bonus maximum Health. Bruisers gain double this bonus.');

INSERT INTO classes_effects (class_id, champions, effect, style) values (3, 2, '200 Health', 1);
INSERT INTO classes_effects (class_id, champions, effect, style) values (3, 4, '325 Health', 2);
INSERT INTO classes_effects (class_id, champions, effect, style) values (3, 6, '450 Health', 2);
INSERT INTO classes_effects (class_id, champions, effect, style) values (3, 8, '700 Health', 3);

-- Cannoneer

INSERT INTO classes (class_name, class_description) values ('Cannoneer', 'Every 5th attack fires a cannon shot that explodes for physical damage around the target.');

INSERT INTO classes_effects (class_id, champions, effect, style) values (4, 2, '150% Attack Damage', 1);
INSERT INTO classes_effects (class_id, champions, effect, style) values (4, 3, '210% Attack Damage', 2);
INSERT INTO classes_effects (class_id, champions, effect, style) values (4, 4, '280% Attack Damage', 2);
INSERT INTO classes_effects (class_id, champions, effect, style) values (4, 5, '350% Attack Damage', 3);

-- Cavalier

INSERT INTO classes (class_name, class_description) values ('Cavalier', 'Innate: Charge quickly towards their target whenever they move.

Cavaliers gain Armor and Magic Resist. At the start of combat and after each charge, gain double the amount for 4 seconds.');

INSERT INTO classes_effects (class_id, champions, effect, style) values (5, 2, '40 Armor, 40 Magic Resist', 1);
INSERT INTO classes_effects (class_id, champions, effect, style) values (5, 3, '60 Armor, 60 Magic Resist', 2);
INSERT INTO classes_effects (class_id, champions, effect, style) values (5, 4, '80 Armor, 80 Magic Resist', 3);
INSERT INTO classes_effects (class_id, champions, effect, style) values (5, 5, '100 Armor, 100 Magic Resist', 4);

-- Dragon

INSERT INTO classes (class_name, class_description) values ('Dragon', '');

INSERT INTO classes_effects (class_id, champions, effect, style) values (6, 1, 'Dragons provide +3 to their origin trait, but require 2 team slots. They also gain 700 bonus Health.

This trait is active with exactly 1 Dragon champion.', 3);

-- Dragonmancer

INSERT INTO classes (class_name, class_description) values ('Dragonmancer', 'Use the Dragonmancer Blessing item to choose a Hero. The Hero gains massively increased Health and Ability Power, which increases by 20% per star level of your Dragonmancers.');

INSERT INTO classes_effects (class_id, champions, effect, style) values (7, 3, '300 Health, +15% Ability Power', 1);
INSERT INTO classes_effects (class_id, champions, effect, style) values (7, 6, '750 Health, +35% Ability Power', 3);
INSERT INTO classes_effects (class_id, champions, effect, style) values (7, 9, '1400 Health, +60% Ability Power', 4);

-- Evoker

INSERT INTO classes (class_name, class_description) values ('Evoker', 'Evokers gain Mana whenever an ally or enemy casts an Ability.');

INSERT INTO classes_effects (class_id, champions, effect, style) values (8, 2, '3 Mana', 1);
INSERT INTO classes_effects (class_id, champions, effect, style) values (8, 4, '6 Mana', 3);
INSERT INTO classes_effects (class_id, champions, effect, style) values (8, 6, '10 Mana', 4);

-- Guardian

INSERT INTO classes (class_name, class_description) values ('Guardian', 'Once per combat at 50% Health, Guardians shield themselves and their closest ally for a percent of their maximum Health. Shields stack!');

INSERT INTO classes_effects (class_id, champions, effect, style) values (9, 2, '30% of max health shield', 1);
INSERT INTO classes_effects (class_id, champions, effect, style) values (9, 4, '45% of max health shield', 3);
INSERT INTO classes_effects (class_id, champions, effect, style) values (9, 6, '65% of max health shield', 4);

-- Legend

INSERT INTO classes (class_name, class_description) values ('Legend', '');

INSERT INTO classes_effects (class_id, champions, effect, style) values (10, 3, 'Each combat: An adjacent ally sacrifices their life to the Legend, which gains 100% of their Health, Armor, and Magic Resistance, plus 40% of their Ability Power.', 3);

-- Mage

INSERT INTO classes (class_name, class_description) values ('Mage', 'Mages cast twice and have modified total Ability Power.');

INSERT INTO classes_effects (class_id, champions, effect, style) values (11, 3, '75% Ability Power', 1);
INSERT INTO classes_effects (class_id, champions, effect, style) values (11, 5, '100% Ability Power', 2);
INSERT INTO classes_effects (class_id, champions, effect, style) values (11, 7, '125% Ability Power', 3);
INSERT INTO classes_effects (class_id, champions, effect, style) values (11, 9, '150% Ability Power', 4);

-- Mystic

INSERT INTO classes (class_name, class_description) values ('Mystic', 'Your team gains Magic Resist.');

INSERT INTO classes_effects (class_id, champions, effect, style) values (12, 2, '50 Magic Resist', 1);
INSERT INTO classes_effects (class_id, champions, effect, style) values (12, 3, '100 Magic Resist', 2);
INSERT INTO classes_effects (class_id, champions, effect, style) values (12, 4, '175 Magic Resist', 3);
INSERT INTO classes_effects (class_id, champions, effect, style) values (12, 5, '300 Magic Resist', 4);

-- Shapeshifter

INSERT INTO classes (class_name, class_description) values ('Shapeshifter', 'Transforming grants bonus maximum Health.');

INSERT INTO classes_effects (class_id, champions, effect, style) values (13, 2, '45% maximum Health', 1);
INSERT INTO classes_effects (class_id, champions, effect, style) values (13, 4, '90% maximum Health', 2);
INSERT INTO classes_effects (class_id, champions, effect, style) values (13, 6, '135% maximum Health', 3);

-- SpellThief

INSERT INTO classes (class_name, class_description) values ('SpellThief', '');

INSERT INTO classes_effects (class_id, champions, effect, style) values (14, 1, 'Zoe nabs a new Ability after each cast and at the start of every round.', 3);

-- Starcaller

INSERT INTO classes (class_name, class_description) values ('Starcaller', '');

INSERT INTO classes_effects (class_id, champions, effect, style) values (15, 1, 'The first Starcaller to cast their Ability during player combat heals you for (2/3/75), depending on their star level. Excess healing disintegrates an enemy champion.', 3);

-- Swiftshot

INSERT INTO classes (class_name, class_description) values ('Swiftshot', 'Innate: gain 2 hex Attack Range.

Swiftshots gain Attack Speed for each hex between themselves and their target.');

INSERT INTO classes_effects (class_id, champions, effect, style) values (16, 2, '10% Attack Speed', 1);
INSERT INTO classes_effects (class_id, champions, effect, style) values (16, 4, '20% Attack Speed', 3);
INSERT INTO classes_effects (class_id, champions, effect, style) values (16, 6, '40% Attack Speed', 4);

-- Warrior

INSERT INTO classes (class_name, class_description) values ('Warrior', 'Warrior attacks have a 33% chance to increase the damage of their next attack.');

INSERT INTO classes_effects (class_id, champions, effect, style) values (17, 2, '120% damage', 1);
INSERT INTO classes_effects (class_id, champions, effect, style) values (17, 4, '200% damage', 3);
INSERT INTO classes_effects (class_id, champions, effect, style) values (17, 6, '350% damage', 4);



