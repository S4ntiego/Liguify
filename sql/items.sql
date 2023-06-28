CREATE TABLE items (
    id SERIAL NOT NULL PRIMARY KEY,
    item_name VARCHAR(255),
    item_id VARCHAR(255) UNIQUE,
    item_description TEXT,
    special_effect TEXT,
    variant VARCHAR(255),
    item_unique BOOLEAN
);

ALTER TABLE items ADD CONSTRAINT item_id_unique UNIQUE (item_id);


INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Guinsoo''s Rageblade', 23, 'Attacks grant 6% bonus Attack Speed. This effect stacks.', '', 'Standard', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Crown of Champions', 3008, 'Every 4 seconds, the next attack deals 9001x the amount of gold in your bank in true damage.', '', 'Standard', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Sunfire Cape', 57, 'Grant 400 bonus Health (including components). Every 2 seconds, an enemy within 2 hexes is burned for 10% of their maximum Health as true damage over 10 seconds, and reducing healing by 50% for the duration.', '', 'Standard', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('More More-ellonomicon', 2037, 'Grant 50 bonus Ability Power. Magic or true damage from an Ability burns the target, dealing 60% of the target''s maximum Health as true damage over 30 seconds, and reducing healing by 50% for the duration.', '', 'Radiant', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Banshee''s Silence', 2079, 'Combat start: Grant a shield to your team that blocks the first enemy Ability, up to 600 damage.Radiant Bonus: +50 Health for all allies.', 'Aura item', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Rascal''s Gloves', 2099, 'Each round: Equip 2 random Radiant items.', 'Consumes 3 item slots.', 'Radiant', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Revel Emblem', 2316, 'The holder gains the Revel trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Shroud of Stillness', 59, 'Combat start: Shoot a beam that increases the maxiumum Mana of affected enemies by 35% until they cast.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Diamond Hands', 3006, 'Once per combat: At 66% Health and 33% Health, become invulnerable for 2 seconds and grant 1 gold.', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Diamond HandsHR', 3016, 'Once per combat: At 66% Health and 33% Health, become invulnerable for 2 seconds and grant 2 gold.', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Mystic Emblem', 2312, 'The holder gains the Mystic trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Zeke''s Herald', 17, 'Combat start: Grant 30% Attack Speed to the holder and allies within 1 hex in the same row.', 'Aura item', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Sunlight Cape', 2057, 'Grant 800 bonus Health. Every 1 seconds, an enemy within 4 hexes is burned for 60% of their maximum Health as true damage over 30 seconds, and reducing healing by 50% for the duration.', '', 'Radiant', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Giant Slayer', 12, 'Abilities and attacks deal 25% bonus damage. If the target has more than 2200 maximum Health, the bonus increases to 50%.', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Infinity Edge', 19, 'Grant 75% Critical Strike Chance (including components) and 10% Critical Strike Damage. Each point of Critical Strike Chance above 100% converts to 1% Critical Strike Damage.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Zz''Rots Invitation', 2027, 'Combat start: A Radiant Voidmother with bonus Health and Attack Damage arises and taunts enemies within 4 hexes. Radiant Voidmothers that arise from summoned units are 25% effective.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Guild Emblem', 2318, 'The holder gains the Guild trait.Guild Bonus: 3% Omnivamp', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Whispers Emblem', 2303, 'The holder gains the Whispers trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Zephyr', 67, 'Combat start: Summon a whirlwind on the opposite side of the arena that removes the closest enemy from combat for 5 seconds.', 'Ignores crowd control immunity', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Locket of Targon Prime', 2035, 'Combat start: Shield the holder and allies within 3 hexes in the same row for 400/500/600 damage for 60 seconds.Radiant Bonus: +200 Health for all allies.', 'Aura item', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Edge of Night', 94, 'Once per combat: At 60% Health, briefly become stealthed, becoming untargetable and shedding negative effects. Then, grant 40% bonus Attack Speed.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Infinity Force', 9004, '', 'Crafted by Ornn', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Cavalier Emblem', 2307, 'The holder gains the Cavalier trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Frozen Heart', 45, 'Reduces the Attack Speed of enemies within 2 hexes by 30%.', 'Aura item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Ionic Spark', 36, 'Enemies within 2 hexes have their Magic Resist reduced by 50%. When they cast an Ability, they are zapped for magic damage equal to 200% of their maximum Mana.', 'Aura item, Direct damage item', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Bloodthirster', 16, 'Grant 25% Omnivamp.Once per combat: At 40% Health, gain a 25% maximum Health shield that lasts up to 5 seconds.', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Morellonomicon', 37, 'Grant 30 bonus Ability Power (including components). Magic or true damage from an Ability burns the target, dealing 10% of the target''s maximum Health as true damage over 10 seconds, and reducing healing by 50% for the duration.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Titan''s Resolve', 25, 'Grant 2 Attack Damage and 2 Ability Power when attacking or taking damage, stacking up to 25 times. At full stacks, grant 25 Armor and 25 Magic Resist.', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Banshee''s Claw', 79, 'Combat start: Grant a shield to the holder and allies within 1 hex in the same row that blocks the first enemy Ability, up to 600 damage.', 'Aura item', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Warmog''s Armor', 77, 'Grant 1000 bonus Health (including components).', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Assassin Emblem', 2325, 'The holder gains the Assassin trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Statikk Shiv', 24, 'Grant 10% bonus Attack Speed (including components). Every 3rd attack unleashes chain lightning that bounces to 4 enemies, dealing 60 magic damage and reducing their Magic Resist by 50% for 5 seconds.', 'Direct damage item', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Guardian Emblem', 2323, 'The holder gains the Guardian trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Gargoyle Stoneplate', 56, 'Grant 18 Armor and 18 Magic Resist for each enemy targeting the holder.', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Runaan''s Hurricane', 26, 'Grant 10 Attack Damage. Attacks fire a bolt at a nearby enemy, dealing 70% Attack Damage as physical damage.', 'Direct damage item', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Hand of Justice', 49, 'Grant 2 effects: +15 Attack Damage and +15 Ability Power. 15% Omnivamp. Each round, randomly double 1 of these effects.', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Chalice of Power', 46, 'Combat start: Grant 30 Ability Power to the holder and allies within 1 hex in the same row.', 'Aura item', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Locket of the Iron Solari', 35, 'Combat start: Shield the holder and allies within 2 hexes in the same row for 300/350/400 damage for 15 seconds.', 'Aura item', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Runaan''s Tempest', 2026, 'Grant 10 Attack Damage. Attacks fire a bolt at a nearby enemy, dealing 110% Attack Damage as physical damage.Radiant Bonus: 30% Attack Speed.​​', 'Direct damage item', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Jade Emblem', 2324, 'The holder gains the Jade trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Obsidian Cleaver', 9006, 'Attacks and Abilities shred enemy Armor and Magic Resistance by 60% for 5 seconds.', 'Crafted by Ornn', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Last Whisper', 29, 'Dealing physical damage reduces the target''s Armor by 50% for 5 seconds. This effect does not stack.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Scalescorn Emblem', 2300, 'The holder gains the Scalescorn trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Eternal Winter', 9003, 'Enemies who damage the holder have their Attack Speed slowed by 30% for 2 seconds. After being slowed this way 7 times, the attacker is Frozen for the duration instead. An enemy can only be Frozen once every 15 seconds.', 'Crafted by Ornn', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Redemption', 47, 'Heal allies within 1 hex for 12% of their missing Health every 5 seconds. They also take 25% less multi-target damage for 5 seconds (damage reduction does not stack).', 'Aura item', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Thief''s Gloves', 99, 'Each round: Equip 2 random items.', 'Consumes 3 item slots.', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Archangel''s Staff', 34, 'Grant 30 bonus Ability Power. 

Combat start: Grant 20 Ability Power every 5 seconds.', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Spear of Shojin', 14, 'Attacks restore 8 additional Mana.', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Zhonya''s Paradox', 9010, 'Once per combat: At 40% Health, become invulnerable for 3 seconds.', 'Crafted by Ornn', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Shroud of Reverence', 2059, 'Combat start: Shoot a wider beam that increases the maxiumum Mana of affected enemies by 50% until they cast. 

Radiant Bonus: 15 starting Mana for all allies.', '', 'Radiant', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Hextech Gunblade', 13, 'Grant 25% Omnivamp. Damage heals the lowest Health ally for the same amount.', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Eternal Whisper', 2029, 'Dealing physical damage reduces the target''s Armor by 50% for the rest of combat. This effect does not stack.Radiant Bonus: 35% Critical Strike Chance.', '', 'Radiant', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Zz''Rot Portal', 27, 'Combat start: Taunt enemies within 4 hexes.On death, a Voidspawn arises, taunting nearby enemies. Voidspawns that arise from summoned units are 25% effective.', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Bramble Vest', 55, 'Grant 60 bonus Armor (including components). Negates 75% bonus damage from incoming critical strikes. When struck by an attack, deal 75/100/150 magic damage to all nearby enemies (once every 2 seconds).', 'Direct damage item', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Dragon''s Claw', 66, 'Grant 120 bonus Magic Resist (including components). Every 2 seconds, regenerate 1% maximum Health for each enemy targeting the holder.If the holder is a Dragon, increase all bonuses and effects by 20%.', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Rapid Firecannon', 22, 'Grant 50% bonus Attack Speed (including components) and 1 Attack Range.Attacks cannot miss.', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Blessed Bloodthirster', 2016, 'Grant 35% Omnivamp.Once per combat: At 40% Health, gain a 35% maximum Health shield that lasts up to 5 seconds.

Radiant Bonus: 20 Attack Damage.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Covalent Spark', 2036, 'Enemies within 3 hexes have their Magic Resist reduced by 50%. When they cast an Ability, they are zapped for magic damage equal to 250% of their maximum Mana.

Radiant Bonus: Regenerate 1% max Health per second.', 'Aura item, Direct damage item', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Deathblade', 11, 'Grant 40/70/100 bonus Attack Damage (including components).', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Gold Collector', 9009, 'Attacks and Abilities execute enemies below 10% of their maximum Health. Executions have a 50% chance to generate 1 gold.', 'Crafted by Ornn', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Anima Visage', 9001, 'Regenerate 5% maximum Health each second.', 'Crafted by Ornn', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Determined Investor', 3005, 'After dying during combat 7 times, this item is destroyed. Upon destruction, grant the item Diamond Hands, 1 Champion Duplicator, and 15 gold.', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Determined Investor', 3015, 'After dying during combat 4 times, this item is destroyed. Upon destruction, grant the item Diamond Hands, 1 Champion Duplicator, and 15 gold.', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Needlessly Big Gem', 3002, 'Once per combat: If the holder is alive after 15 seconds of combat, grant 1 gold per 3 living allies, and each living ally deals 1% more damage per gold in your bank (up to 80 gold).', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Needlessly Big Gem', 3012, 'Once per combat: If the holder is alive after 15 seconds of combat, grant 1 gold per 2 living allies, and each living ally deals 3% more damage per gold in your bank (up to 15 gold).', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Goldmancer''s Staff', 3003, 'Grant 1 Ability Power per gold in your bank (up to 80 gold) and a 50% chance to drop 2 gold on enemy kill.', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Goldmancer''s Staff', 3013, 'Grant 3 Ability Power per gold in your bank (up to 15 gold) and a 80% chance to drop 2 gold on enemy kill.', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Gambler''s Blade', 3004, 'Grant 1% bonus Attack Speed per gold in your bank (up to 80 gold).Each attack has a 6% chance to drop 1 gold.', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Gambler''s Blade', 3014, 'Grant 3% bonus Attack Speed per gold in your bank (up to 15 gold).Each attack has a 10% chance to drop 1 gold.', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Rabadon''s Ascended Deathcap', 2033, 'Grant 120 bonus Ability Power.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Draven''s Axe', 3001, 'Gain 1 Attack Damage per gold in your bank (up to 80 gold).Attacks grant 1 stack, up to 100 times. At full stacks, grant 8 gold and 1 item component.', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Draven''s Axe', 3011, 'Gain 3 Attack Damage per gold in your bank (up to 15 gold).Attacks grant 1 stack, up to 50 times. At full stacks, grant 7 gold and 1 item component.', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Astral Emblem', 2306, 'The holder gains the Astral trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Demonslayer', 2012, 'Abilities and attacks deal 35% bonus damage. If the target has more than 2200 maximum Health, the bonus increases to 70%.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Glamorous Gauntlet', 2039, 'Grant 75% Critical Strike Damage and 20 bonus Ability Power. Magic and true damage from an Ability can critically strike.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Ragewing Emblem', 2315, 'The holder gains the Ragewing trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Spear of Hirana', 2014, 'Attacks restore 12 additional Mana. 

Radiant Bonus: 20 Ability Power.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Shimmerscale Emblem', 2302, 'The holder gains the Shimmerscale trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Mogul''s Mail', 3000, 'Grant 1 Armor, 1 Magic Resist, and 5 Health when taking damage, stacking up to 40 times.At full stacks, grant 2 gold.', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Mogul''s Mail', 3010, 'Grant 1 Armor, 1 Magic Resist, and 5 Health when taking damage, stacking up to 40 times.At full stacks, grant 3 gold.', 'Shimmerscale item', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Absolution', 2047, 'Heal allies within 2 hexes for 18% of their missing Health every 5 seconds. They also take 25% less multi-target damage for 5 seconds (damage reduction does not stack).

Radiant Bonus: 150 Health.', 'Aura item', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Warrior Emblem', 2308, 'The holder gains the Warrior trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Dragonmancer Emblem', 2426, 'The holder gains the Dragonmancer trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Blue Blessing', 2044, 'Grant 50 starting Mana. Gain 30 Mana after casting an Ability.

Radiant Bonus: 30 Ability Power.', '', 'Radiant', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Rapid Lightcannon', 2022, 'Grant 75% bonus Attack Speed and 2 Attack Range.Attacks cannot miss.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Hextech Lifeblade', 2013, 'Grant 35% Omnivamp: damage dealt heals the lowest Health ally for the same amount. 

Radiant Bonus: +30 Ability Power.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Dvarapala Stoneplate', 2056, 'Grant 30 Armor and 30 Magic Resist for each enemy targeting the holder. 

Radiant Bonus: Regenerate 1% max Health each second.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Luminous Deathblade', 2011, 'Grant 60/100/140 bonus Attack Damage.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Rosethorn Vest', 2055, 'Grant 100 bonus Armor. Negates all bonus damage from incoming critical strikes. On being hit by an attack, deal 125/175/225 magic damage to all nearby enemies (once every 2 seconds).', 'Direct damage item', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Titan''s Vow', 2025, 'Grant 3 Attack Damage and 3 Ability Power when attacking or taking damage, stacking up to 25 times.At full stacks, grant 50 Armor and 50 Magic Resist.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Quickestsilver', 2069, 'Grant 50% bonus Attack Speed.Combat start: Grant immunity to crowd control for 30 seconds.', '', 'Radiant', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Legend Emblem', 2425, 'The holder gains the Legend trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Brink of Dawn', 2015, 'Once per combat: At 60% Health and again at 30% Health, briefly become stealthed, becoming untargetable and shedding negative effects. Then, grant 40% bonus Attack Speed. This effect stacks.', '', 'Radiant', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Warmog''s Pride', 2077, 'Grant 1600 bonus Health.Radiant Bonus: Regenerate 1% max Health per second.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Tempest Emblem', 2310, 'The holder gains the Tempest trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Manazane', 9005, 'Once per combat: After casting a spell, restore 150 Mana over 4 seconds.', 'Crafted by Ornn', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Swiftshot Emblem', 2313, 'The holder gains the Swiftshot trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Tactician''s Crown', 88, 'Your team gains +1 maximum team size.', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Mage Emblem', 2311, 'The holder gains the Mage trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Dragon''s Will', 2066, 'Grant 180 bonus Magic Resist. Every 1.5 seconds, regenerate 2% maximum Health for each enemy targeting the holder. If the holder is a Dragon, increase all bonuses and effects by 20%.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Mirage Emblem', 2314, 'The holder gains the Mirage trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Cannoneer Emblem', 2301, 'The holder gains the Cannoneer trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Evoker Emblem', 2317, 'The holder gains the Evoker trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Chalice of Charity', 2046, 'Combat start: Grant 50 Ability Power and 10% Omnivamp to the holder and allies within 1 hex in the same row.', 'Aura item', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Guinsoo''s Reckoning', 2023, 'Attacks grant +10% bonus Attack Speed. This effect stacks.

Radiant Bonus: 15% Attack Speed.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Mistral', 2067, 'Combat start: Summon a whirlwind on the opposite side of the arena that removes the closest enemy from combat for 8 seconds. 

Radiant Bonus: 10% Attack Speed for all allies.', 'Ignores crowd control immunity', 'Radiant', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Statikk''s Favor', 2024, 'Grant 10% bonus Attack Speed. Every 3rd attack unleashes chain lightning that bounces to 8 enemies, dealing 100 magic damage and reducing their Magic Resist by 50% for 5 seconds.', 'Direct damage item', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Zenith Edge', 2019, 'Grant 75% Critical Strike Chance and 50% Critical Strike Damage. Each point of Critical Strike Chance above 100% converts to 1% Critical Strike Damage.', '', 'Radiant', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Fist of Fairness', 2049, 'Grant 2 effects: 40 Attack Damage and 40 Ability Power. 40% Omnivamp.', '', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Blue Buff', 44, 'Grant 50 starting Mana (including components). Gain 20 Mana after casting an Ability.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Rocket-Propelled Fist', 9008, 'Combat start: The farthest enemy is pulled into melee range and stunned for 2 seconds. Allies within range will prioritize attacking that enemy.', 'Crafted by Ornn', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Fractured Mirror', 10006, 'Fractured Mirror empty slot', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Jeweled Gauntlet', 39, 'Grant 30% Critical Strike Damage and 20 bonus Ability Power (including components). Magic and true damage from an Ability can critically strike.', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Death''s Defiance', 9002, 'Grant 25% Omnivamp. 50% of the damage the holder receives is instead dealt over 4 seconds as non-lethal damage.', 'Crafted by Ornn', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Rabadon''s Deathcap', 33, 'Grant 75 bonus Ability Power (including components).', '', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Bruiser Emblem', 2305, 'The holder gains the Bruiser trait.', '', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Randuin''s Sanctrum', 9007, 'Combat start: Grant 50 Armor and 50 Magic Resistance to all adjacent allies, not including the holder.', 'Crafted by Ornn', 'Normal', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Frozen Heart of Gold', 2045, 'Reduces the Attack Speed of enemies within 2 hexes by 50%.

Radiant Bonus: 30 starting Mana.', 'Aura item', 'Radiant', true);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Zeke''s Harmony', 2017, 'Combat start: Grant 50% Attack Speed and 10% Omnivamp to the holder and allies within 1 hex in the same row.​​', 'Aura item', 'Radiant', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('B.F Sword', 1, '+10 Attack Damage', 'Component', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Recurve Bow', 2, '+10% Attack Speed', 'Component', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Tear of the Goddess', 4, '+15 Mana', 'Component', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Chain Vest', 5, '+20 Armor', 'Component', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Negatron Cloak', 6, '+20 Magic Resist', 'Component', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Giant''s Belt', 7, '+150 Health', 'Component', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Sparring Gloves', 9, '+5% Critical Strike Chance

+10% Dodge Chance', 'Component', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Spatula', 8, 'It must do something...', 'Component', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Needlessly Large Rod', 3, '+10 Ability Power', 'Component', 'Normal', false);

INSERT INTO items (item_name, item_id, item_description, special_effect, variant, item_unique) values ('Delicious Snax', 41105, 'Nomsy needs to eat this many more Snax to level up!', 'Trainer''s item', 'Normal', false);





