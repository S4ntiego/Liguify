    CREATE TABLE traits (
    trait_id SERIAL NOT NULL PRIMARY KEY,
    trait_name VARCHAR(255) UNIQUE,
    trait_description TEXT
);

CREATE TABLE traits_effects (
    trait_id INTEGER NOT NULL,
    champions INTEGER,
    effect VARCHAR(256),
    style INTEGER,
    CONSTRAINT fk_trait_id FOREIGN KEY (trait_id) REFERENCES traits (trait_id)
);

INSERT INTO traits (trait_name, trait_description) values ('Assassin', 'Innate: When combat starts, Assassins leap to the enemy backline.

Assassins'' Abilities can critically strike and they gain bonus Critical Strike Chance and bonus Critical Strike Damage.');

INSERT INTO traits (trait_name, trait_description) values ('Bard', '');

INSERT INTO traits (trait_name, trait_description) values ('Bruiser', 'Your team gains bonus maximum Health. Bruisers gain double this bonus.');

INSERT INTO traits (trait_name, trait_description) values ('Cannoneer', 'Every 5th attack fires a cannon shot that explodes for physical damage around the target.');

INSERT INTO traits (trait_name, trait_description) values ('Cavalier', 'Innate: Charge quickly towards their target whenever they move.

Cavaliers gain Armor and Magic Resist. At the start of combat and after each charge, gain double the amount for 4 seconds.');

INSERT INTO traits (trait_name, trait_description) values ('Dragon', '');

INSERT INTO traits (trait_name, trait_description) values ('Dragonmancer', 'Use the Dragonmancer Blessing item to choose a Hero. The Hero gains massively increased Health and Ability Power, which increases by 20% per star level of your Dragonmancers.');

INSERT INTO traits (trait_name, trait_description) values ('Evoker', 'Evokers gain Mana whenever an ally or enemy casts an Ability.');

INSERT INTO traits (trait_name, trait_description) values ('Guardian', 'Once per combat at 50% Health, Guardians shield themselves and their closest ally for a percent of their maximum Health. Shields stack!');

INSERT INTO traits (trait_name, trait_description) values ('Legend', '');

INSERT INTO traits (trait_name, trait_description) values ('Mage', 'Mages cast twice and have modified total Ability Power.');

INSERT INTO traits (trait_name, trait_description) values ('Mystic', 'Your team gains Magic Resist.');

INSERT INTO traits (trait_name, trait_description) values ('Shapeshifter', 'Transforming grants bonus maximum Health.');

INSERT INTO traits (trait_name, trait_description) values ('SpellThief', '');

INSERT INTO traits (trait_name, trait_description) values ('Starcaller', '');

INSERT INTO traits (trait_name, trait_description) values ('Swiftshot', 'Innate: gain 2 hex Attack Range.

Swiftshots gain Attack Speed for each hex between themselves and their target.');

INSERT INTO traits (trait_name, trait_description) values ('Warrior', 'Warrior attacks have a 33% chance to increase the damage of their next attack.');

INSERT INTO traits (trait_name, trait_description) values ('Astral', 'Every 5th Shop has increased odds to show Astral champions, and also grants an Astral orb. 

Your team gains bonus Ability Power.');

INSERT INTO traits (trait_name, trait_description) values ('Guild', 'Grant a unique bonus to your team; Guild members gain double the amount. Increases for each Guild member in play!

Sejuani: +100 Health

Twitch: +10% Attack Speed

Ryze: +10 Ability Power

Talon: +10 Attack Damage

Bard: +2 Mana per attack

Emblem: +3% Omnivamp (healing for a percentage of damage dealt)');

INSERT INTO traits (trait_name, trait_description) values ('Jade', 'Summon movable Jade Statues that grow in power.

Each combat, allies adjacent to a statue gain Attack Speed and maximum Health healing every 2 seconds. When a statue is destroyed, it deals 33% of its Health as magic damage to nearby enemies.');

INSERT INTO traits (trait_name, trait_description) values ('Mirage', 'Mirage champions gain a different Trait bonus from game to game.

Electric Overload: When attacking or being hit by an attack, gain a chance to deal 8% of their maximum Health as magic damage to adjacent enemies.

Warlord''s Honor: After winning any combat, gain bonus Health and Ability Power. Increases by 10% per win, stacks up to 5 times!

Pirate''s Greed: Gain a chest of loot after each player combat.

Dawnbringer''s Determination: Once per combat, rapidly heal at 50% Health.

Executioner''s Edge: Always critically strike low Heath targets with Attacks and Abilities. Gain bonus Critial Strike Damage.

Spellsword''s Enchantment: Each player combat, gain Ability Power per attack.

Duelist''s Dexterity: Innate: Mirage units move faster. Attacks grant bonus Attack Speed, up to 10 stacks.');

INSERT INTO traits (trait_name, trait_description) values ('Ragewing', 'Innate: Convert Mana to Rage; attacks generate 15 Rage. After casting an Ability, enrage for 4 seconds: +25% Attack Speed but can''t gain Rage.

Gain bonus stats when enraged');

INSERT INTO traits (trait_name, trait_description) values ('Revel', 'After dealing damage with an Ability, launch a firecracker that deals magic damage to a random enemy.');

INSERT INTO traits (trait_name, trait_description) values ('Scalescorn', 'If you don''t have a Dragon on your team, Scalescorn champions deal bonus magic damage and take 25% reduced damage from enemies with more than 2200 Health.');

INSERT INTO traits (trait_name, trait_description) values ('Shimmerscale', 'Grant exclusive random Shimmerscale items.');

INSERT INTO traits (trait_name, trait_description) values ('Tempest', 'After 8 seconds, lightning strikes that battlefield. Enemies are stunned for 1 second and take a percent of their maximum Health as true damage. Tempest champions gaian Attack Speed.');

INSERT INTO traits (trait_name, trait_description) values ('Trainer', 'Every round, each Trainer feeds 1 Snax per star level to Nomsy, adding Health and Ability Power. Nomsy''s star level increases every 25 Snax!');

INSERT INTO traits (trait_name, trait_description) values ('Whispers', 'Whispers damage shrinks enemies, reducing their Armor and Magic Resist by 40% for 6 seconds.

When they damage a shrunken enemy, Whispers gain stacking bonuses');

INSERT INTO traits_effects (trait_id, champions, effect, style) values (11, 2, '1 Attack Damage and Ability Power', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (11, 4, '3 Attack Damage and Ability Power', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (11, 6, '5 Attack Damage and Ability Power', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (11, 8, '8 Attack Damage and Ability Power', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (10, 2, 'Summon Nomsy!', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (10, 3, 'Nomsy''s Ability deals 100% more damage.', 3);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (9, 2, '10% damage, 25% Attack Speed', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (9, 4, '20% damage, 50% Attack Speed', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (9, 6, '30% damage, 80% Attack Speed', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (9, 8, '45% damage, 150% Attack Speed', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (8, 3, '1 unique item', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (8, 5, '2 unique items', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (8, 7, '4 unique items', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (8, 9, '5 unique items, which includes Crown of Champions', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (7, 2, '15% magic damage', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (7, 4, '50% magic damage', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (7, 6, '100% magic damage', 3);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (6, 2, '140 magic damage', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (6, 3, '170 magic damage', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (6, 4, '225 magic damage', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (6, 5, '300 magic damage', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (5, 3, '50% Attack Speed, 30% Omnivamp', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (5, 6, '150% Attack Speed, 50% Omnivamp', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (5, 9, '250% Attack Speed, 70% Omnivamp', 3);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (4, 2, 'Selected randomly each game', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (4, 4, 'Selected randomly each game', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (4, 6, 'Selected randomly each game', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (4, 8, 'Selected randomly each game', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (3, 3, '1 statue, +2% healing, +20% Attack Speed', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (3, 6, '2 statues, +5% healing, +40% Attack Speed', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (3, 9, '3 statues, +8% healing, +60% Attack Speed', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (3, 12, '4 statues, +25% healing, +100% Attack Speed', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (2, 1, '100% Guild bonus', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (2, 2, '120% Guild bonus', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (2, 3, '140% Guild bonus', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (2, 4, '160% Guild bonus', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (2, 5, '180% Guild bonus', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (2, 6, '200% Guild bonus', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (1, 3, '5 Ability Power', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (1, 6, '30 Ability Power, Orb value increases', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (1, 9, '70 Ability Power, Orbs may contain components', 3);


INSERT INTO traits_effects (trait_id, champions, effect, style) values (17, 2, '120% damage', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (17, 4, '200% damage', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (17, 6, '350% damage', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (16, 2, '10% Attack Speed', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (16, 4, '20% Attack Speed', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (16, 6, '40% Attack Speed', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (15, 1, 'The first Starcaller to cast their Ability during player combat heals you for (2/3/75), depending on their star level. Excess healing disintegrates an enemy champion.', 3);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (14, 1, 'Zoe nabs a new Ability after each cast and at the start of every round.', 3);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (13, 2, '45% maximum Health', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (13, 4, '90% maximum Health', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (13, 6, '135% maximum Health', 3);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (12, 2, '50 Magic Resist', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (12, 3, '100 Magic Resist', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (12, 4, '175 Magic Resist', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (12, 5, '300 Magic Resist', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (11, 3, '75% Ability Power', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (11, 5, '100% Ability Power', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (11, 7, '125% Ability Power', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (11, 9, '150% Ability Power', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (10, 3, 'Each combat: An adjacent ally sacrifices their life to the Legend, which gains 100% of their Health, Armor, and Magic Resistance, plus 40% of their Ability Power.', 3);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (9, 2, '30% of max health shield', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (9, 4, '45% of max health shield', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (9, 6, '65% of max health shield', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (8, 2, '3 Mana', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (8, 4, '6 Mana', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (8, 6, '10 Mana', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (7, 3, '300 Health, +15% Ability Power', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (7, 6, '750 Health, +35% Ability Power', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (7, 9, '1400 Health, +60% Ability Power', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (6, 1, 'Dragons provide +3 to their origin trait, but require 2 team slots. They also gain 700 bonus Health.

This trait is active with exactly 1 Dragon champion.', 3);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (5, 2, '40 Armor, 40 Magic Resist', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (5, 3, '60 Armor, 60 Magic Resist', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (5, 4, '80 Armor, 80 Magic Resist', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (5, 5, '100 Armor, 100 Magic Resist', 4);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (4, 2, '150% Attack Damage', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (4, 3, '210% Attack Damage', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (4, 4, '280% Attack Damage', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (4, 5, '350% Attack Damage', 3);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (3, 2, '200 Health', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (3, 4, '325 Health', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (3, 6, '450 Health', 2);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (3, 8, '700 Health', 3);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (2, 1, 'Allies that survive player combat have a 2% chance to create a Doot. Bard always creates a Doot when dancing.

Each Doot you collect increases your Shop odds for higher-tier champions by 1%.', 3);

INSERT INTO traits_effects (trait_id, champions, effect, style) values (1, 2, '15% Crit Chance & 15% Crit Damage', 1);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (1, 4, '30% Crit Chance & 30% Crit Damage', 3);
INSERT INTO traits_effects (trait_id, champions, effect, style) values (1, 6, '45% Crit Chance & 50% Crit Damage', 4);
