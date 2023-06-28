    CREATE TABLE augments (
    id SERIAL NOT NULL UNIQUE,
    augment_id INTEGER UNIQUE,
    augment_name VARCHAR(255),
    augment_api_name VARCHAR(255) UNIQUE,
    augment_description TEXT,
    augment_tier INTEGER,
    augment_set INTEGER,
    augment_variant VARCHAR(255),
);



INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2415, 'AFK', 'AFK', 'You cannot perform actions for the next 3 rounds. Afterwards, gain 20 gold.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2469, 'AFK', 'AFKHR', 'You cannot perform actions for the next 2 rounds. Afterwards, gain 15 gold.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2328, 'Assassin Heart', 'AssassinTrait', 'Your team counts as having 1 additional Assassin. Gain a Kayn.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2333, 'Astral Crest', 'AstralEmblem',  'Gain an Astral Emblem and a Nami.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2332, 'Astral Heart', 'AstralTrait', 'Your team counts as having 1 additional Astral. Gain a Nami.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2409, 'Axiom Arc I', 'AxiomArc1', 'Your units gain 20 Mana on kill.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2437, 'Band of Thieves I', 'BandOfThieves1', 'Gain 1 Thief''s Gloves.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2398, 'Best Friends I', 'BestFriends1', 'Units isolated in pairs gain 15.0% Attack Speed and 15 Armor at the start of combat.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2445, 'Big Friend I', 'BigFriend', 'Your units that start combat next to a unit with over 2000 Health take 10% less damage for the rest of combat.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (620, 'Bruiser Heart', 'BruiserTrait',  'Your team counts as having 1 additional Bruiser. Gain a Shen.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (833, 'Built Different I', 'Traitless1', 'Your units with no Traits active gain 250-400 Health and 40-70% Attack Speed (based on current Stage).', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2371, 'Cannoneer Heart', 'CannoneerTrait', 'Your team counts as having 1 additional Cannoneer. Gain a Tristana.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2335, 'Cavalier Heart', 'CavalierTrait', 'Your team counts as having 1 additional Cavalier. Gain a Lillia.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (623, 'Celestial Blessing I', 'CelestialBlessing1', 'Your units heal for 12% of the damage dealt by attacks and Abilities. Excess healing is converted to a shield up to 300 Health.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (643, 'Cybernetic Implants I', 'CyberneticImplants1', 'Your champions holding an item gain 125 Health and 10 Attack Damage.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (786, 'Cybernetic Shell I', 'CyberneticShell1', 'Your champions holding an item gain 125 Health and 20 Armor.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (783, 'Cybernetic Uplink I', 'CyberneticUplink1', 'Your champions holding an item gain 125 Health and restore 2 Mana per second.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (739, 'Double Trouble I', 'Twins1', 'If you have exactly 2 copies of a champion on your board, they both gain 30 Attack Damage, Ability Power, Armor, and Magic Resist. When you 3-star, gain a 2-star copy.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2382, 'Dragonmancer Heart', 'DragonmancerTrait', 'Your team counts as having 1 additional Dragonmancer. Gain an Ashe.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (762, 'Electrocharge I', 'Electrocharge1', 'When your units receive critical strikes, they deal 60-105 (based on current Stage) magic damage to nearby enemies (1 second cooldown).', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2356, 'Evoker Heart', 'EvokerTrait', 'Your team counts as having 1 additional Evoker. Gain a Lulu.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (646, 'Exiles I', 'Distancing', 'Your units that start combat with no adjacent allies gain a 25% maximum Health shield for 10 seconds.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (846, 'Featherweights I', 'Featherweights1', 'Your Tier 1 and 2 champions gain 25% Attack Speed and Move Speed.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (664, 'First Aid Kit I', 'FirstAidKit', 'All healing and shielding on your units is increased by 25.0%.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2387, 'Guardian Heart', 'GuardianTrait', 'Your team counts as having 1 additional Guardian. Gain a Thresh.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2338, 'Guild Heart', 'GuildTrait',  'Your team counts as having 1 additional Guild. Gain a Twitch.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (874, 'Item Grab Bag I', 'ItemGrabBag1', 'Gain 1 random completed item.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2360, 'Jade Crest', 'JadeEmblem', 'Gain a Jade Emblem and an Ashe.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2438, 'Lategame Specialist', 'LategameSpecialist', 'When you reach Level 9, gain 40 gold.', 1, 7);



INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (792, 'Luden''s Echo I', 'LudensEcho1', 'When your units cast and deal Ability damage, the first target hit and a nearby enemy take 60-120 (based on current Stage) magic damage.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (684, 'Makeshift Armor I', 'MakeshiftArmor1', 'Your units without items equipped gain 30 Armor and Magic Resist.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (820, 'Meditation I', 'Meditation1', 'Your units without items equipped restore 4 Mana per second.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2341, 'Mirage Heart', 'MirageTrait', 'Your team counts as having 1 additional Mirage. Gain a Yone.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2374, 'Mystic Heart', 'MysticTrait', 'Your team counts as having 1 additional Mystic. Gain a Nami.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (698, 'Pandora''s Items', 'PandorasItems', 'Gain a random component. At the start of each round, items on your bench are randomized (excluding Tactician''s Crown, Spatula, and consumables).', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2439, 'Preparation I', 'Preparation', 'Champions on your bench permanently gain 6 Attack Damage and Ability Power every round, up to 24.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2473, 'Preparation I', 'Preparation1HR', 'Champions on your bench permanently gain 7 Attack Damage and Ability Power every round, up to 21.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2362, 'Ragewing Heart', 'RagewingTrait', 'Your team counts as having 1 additional Ragewing. Gain a Shen.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (754, 'Recombobulator', 'Recombobulator', 'Champions on your board permanently transform into random champions that cost 1 more. Gain 2 Magnetic Removers.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2384, 'Revel Heart', 'RevelTrait',  'Your team counts as having 1 additional Revel. Gain a Jinx.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2347, 'Scalescorn Heart', 'ScalescornTrait', 'Your team counts as having 1 additional Scalescorn. Gain a Braum.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (765, 'Second Wind I', 'SecondWind1', 'After 10 seconds of combat, your units heal 40% of their missing Health.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2377, 'Shapeshifter Heart', 'ShapeshifterTrait', 'Your team counts as having 1 additional Shapeshifter. Gain a Gnar.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2366, 'Shimmerscale Crest', 'ShimmerscaleEmblem', 'Gain a Shimmerscale Emblem and a Kayn.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (649, 'Stand United I', 'Diversify1', 'Your units gain 2 Attack Damage and Ability Power per Trait active across your army.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2350, 'Swiftshot Heart', 'SwiftshotTrait',  'Your team counts has having 1 additional Swiftshot. Gain a Twitch.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2353, 'Tempest Heart', 'TempestTrait',  'Your team counts as having 1 additional Tempest. Gain a Qiyana.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (733, 'Thrill of the Hunt I', 'ThrillOfTheHunt1', 'Your units heal 400 Health on kill.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (868, 'Tiny Titans', 'TinyTitans', 'Your Tactician heals 30 Health, grows larger, and has 130 maximum Health.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (863, 'Tri Force I', 'TriForce1', 'Your Tier 3 champions gain 133 Health, 13 starting Mana, and 13% Attack Speed.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2329, 'Warrior Heart', 'WarriorTrait', 'Your team counts as having 1 additional Warrior. Gain a Yone.', 1, 7);


INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (745, 'Weakspot', 'Weakspot', 'Your units'' attacks ignore 20% of the target''s Armor and reduce healing received by 50% for 5 seconds.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2368, 'Whispers Heart', 'WhispersTrait', 'Your team counts as having 1 additional Whispers. Gain a Thresh.', 1, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (737, 'Ancient Archives I', 'TomeOfTraits1', 'Gain 1 Tome of Traits.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (610, 'Ascension', 'Ascension', 'After 15 seconds of combat, your units deal 50% more damage.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (838, 'Assassin Crest', 'AssassinEmblem', 'Gain an Assassin Emblem and a Kayn.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2414, 'Axiom Arc II', 'AxiomArc2', 'Your units gain 30 Mana on kill.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2416, 'Beast''s Den', 'ShapeshifterBeastsDen', 'Units that start combat next to 2+ Shapeshifters gain 35.0% Attack Speed and Movement Speed. Shapeshifters always gain this bonus. Gain a Gnar.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2399, 'Best Friends II', 'BestFriends2', 'Units isolated in pairs gain 25.0% Attack Speed and 25 Armor at the start of combat.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2394, 'Better Together', 'MikaelsGift', 'Aura items that buff your team have their effects increased by 33.0%. Gain a Locket of the Iron Solari.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2465, 'Big Friend II', 'BigFriend2', 'Your units that start combat next to a unit with over 2000 Health take 18% less damage for the rest of combat.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (758, 'Blue Battery', 'BlueBattery2', 'After casting their Ability, your units restore 20 Mana.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2345, 'Bruiser Crest', 'BruiserEmblem', 'Gain a Bruiser Emblem and a Shen.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (740, 'Built Different II', 'Traitless2', 'Your units with no Traits active gain 300-600 Health and 50-80% Attack Speed (based on current Stage).', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (622, 'Calculated Loss', 'CalculatedLoss', 'After losing your combat, gain 2 gold and a free Shop refresh.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2372, 'Cannoneer Crest', 'CannoneerEmblem', 'Gain a Cannoneer Emblem and a Jinx.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2336, 'Cavalier Crest', 'CavalierEmblem', 'Gain a Cavalier Emblem and a Sejuani.', 2, 7);



INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (624, 'Celestial Blessing II', 'CelestialBlessing2', 'Your units heal for 20% of the damage dealt by attacks and Abilities. Excess healing is converted to a shield up to 450 Health.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (637, 'Clear Mind', 'ClearMind', 'If you have no champions on your bench at the end of a round, gain 3 experience points.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2413, 'Cluttered Mind', 'ClutteredMind', 'If your bench is full at the end of a round, gain 3 experience points.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2395, 'Combat Training I', 'Bloodlust1', 'Your champions permanently gain 1 Attack Damage every time they kill an enemy. Champions start with 5 bonus Attack Damage.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (682, 'Component Grab Bag', 'ComponentGrabBag', 'Gain 3 random item components.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (861, 'Cutthroat', 'AssassinCutthroat', 'Assassins Mana-Reave the first unit they attack, increasing their maximum Mana by 50% until they cast. Assassins deal 10% more damage against Mana-Reaved enemies. Gain a Qiyana.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (644, 'Cybernetic Implants II', 'CyberneticImplants2', 'Your champions holding an item gain 200 Health and 20 Attack Damage.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (787, 'Cybernetic Shell II', 'CyberneticShell2', 'Your champions holding an item gain 200 Health and 30 Armor.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (784, 'Cybernetic Uplink II', 'CyberneticUplink2', 'Your champions holding an item gain 200 Health and restore 3 Mana per second.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2412, 'Devastating Charge', 'CavalierDevastatingCharge', 'Cavalier''s first attack after charging deals 75 magic damage, increased by 1% for each Armor and Magic Resist they have. Gain a Lillia.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (869, 'Double Trouble II', 'Twins2', 'If you have exactly 2 copies of a champion on your board, they both gain 40 Attack Damage, Ability Power, Armor, and Magic Resist. When you 3-star, gain a 2-star copy.', 2, 7);



INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2403, 'Dragon Alliance', 'DragonAlliance', 'The Dragon trait remains active regardless of how many Dragons you have. Dragons gain 25 Armor and Magic Resist. Gain a Tier 4 Dragon.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2459, 'Dragon Horde', 'DragonHorde', 'The Dragon trait remains active regardless of how many Dragons you have. Dragons gain 15 Attack Damage and Ability Power. Gain a random Tier 4 Dragon.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2460, 'Dragonmancer Crest', 'DragonmancerEmblem', 'Gain a Dragonmancer Emblem and an Ashe.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (763, 'Electrocharge II', 'Electrocharge2', 'When your units receive critical strikes, they deal 85-145 (based on current Stage) magic damage to nearby enemies (1 second cooldown).', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2424, 'Essence Theft', 'EvokerEssenceTheft', 'Evoker''s attacks steal 5 Mana from their target. Gain a Lulu.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2411, 'Eternal Protection', 'JadeEternalProtection', 'When one of your Jade champions would die, the nearest Jade Statue protects them, sacrificing 70% of its max Health and transferring 150% of the sacrificed Health to the champion. Gain an Ashe.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2317, 'Evoker Crest', 'EvokerEmblem', 'Gain an Evoker Emblem and a Lulu.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (647, 'Exiles II', 'Distancing2', 'Your units that start combat with no adjacent allies gain a 35% maximum Health shield for 10 seconds.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2407, 'Eye of the Storm', 'TempestEyeOfTheStorm', 'The unit in the center of the board gains 40 Ability Power, increased to 120 after Tempest''s lightning strikes. Gain a Qiyana.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (662, 'Featherweights II', 'Featherweights2', 'Your Tier 1 and 2 champions gain 35% Attack Speed and Move Speed.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2461, 'First Aid Kit II', 'FirstAidKit2', 'All healing and shielding on your units is increased by 35.0%.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (854, 'Future Sight I', 'FuturePeepers', 'Know who you will fight next. Gain a Zephyr.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2402, 'Gadget Expert', 'GadgetExpert', 'Direct damage items deal 40.0% more damage as true damage. Gain a Statikk Shiv.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2454, 'Gear Upgrades', 'GuildGearUpgrades', 'Guild champions holding an item gain 35 Armor and an additional 200% of their base Guild Bonus. Gain a Twitch.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2388, 'Guardian Crest', 'GuardianEmblem', 'Gain a Guardian Emblem and a Braum.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2339, 'Guild Crest', 'GuildEmblem', 'Gain a Guild Emblem and a Twitch.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2434, 'Hallucinate', 'MirageHallucinate', 'Mirage champions take 90% less damage for the first 5 seconds of combat. Gain a Yone.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2441, 'Heroic Presence', 'GuardianHeroicPresence', 'Every 2 seconds, Guardians taunt all enemies within range. Enemies that attack a Guardian''s shield take magic damage equal to 6% of the shielded unit''s max Health (up to once per second). Gain a Thresh.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2443, 'Hot Shot', 'CannoneerHotShot', 'Cannoneer''s cannon shots burn their targets, dealing 8% of the target''s maximum Health as true damage over 2 seconds, and reducing healing by 50% for the duration of the burn. Gain a Tristana.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (673, 'Hustler', 'HyperRoll', 'If you have less than 20 gold at the end of a round, gain 2 gold.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2451, 'Inspire', 'DragonmancerInspire', 'When the Dragonmancer Hero gets a takedown, champions that share a trait with the Dragonmancer Hero gain 70% Attack Speed for 4 seconds. Gain an Ashe.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2453, 'Intercosmic Gifts', 'AstralIntercosmicGifts', 'Astral Orbs have a 50% chance to spawn a small bonus orb that contains loot. Gain a Nami.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2359, 'Jade Heart', 'JadeTrait', 'Your team counts as having 1 additional Jade. Gain a Gnar.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (771, 'Jeweled Lotus', 'JeweledLotus', 'Magic and true damage from your units'' Abilities can critically strike. Your units gain 20% Critical Strike Chance.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2450, 'Last Stand', 'LastStand', 'The first time you would be eliminated or reduced to 1 Health, instead remain alive. After this effect triggers, your units permanently gain 200 Health, 20 Armor and Magic Resist, and 20% Omnivamp.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2419, 'Loot Master', 'GuildLoot', 'Gain a random component every 4 player combats when you have at least Guild (2) active. Gain a Twitch.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2478, 'Loot Master', 'GuildLootHR', 'Gain a random component every 2 player combats when you have at least Guild (2) active. Gain a Twitch.', 2, 7);



INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (793, 'Luden''s Echo II', 'LudensEcho2', 'When your units cast and deal Ability damage, the first target hit and a nearby enemy take 85-160 (based on current Stage) magic damage.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2444, 'Mage Conference', 'MageConference', 'After combat with a player, a random Mage portals onto your bench. Gain a Lillia.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2472, 'Mage Conference', 'MageConferenceHR', 'After combat with a player, one or two random Mages portal onto your bench. Gain a Lillia.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2380, 'Mage Crest', 'MageEmblem', 'Gain a Mage Emblem and a Vladimir.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (685, 'Makeshift Armor II', 'MakeshiftArmor2', 'Your units without items equipped gain 45 Armor and Magic Resist.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (781, 'Meditation II', 'Meditation2', 'Your units without items equipped restore 6 Mana per second.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (696, 'Metabolic Accelerator', 'MetabolicAccelerator', 'Your Tactician moves faster and heals 2 Health after a PvP round.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2342, 'Mirage Crest', 'MirageEmblem', 'Gain a Mirage Emblem and a Nunu.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2375, 'Mystic Crest', 'MysticEmblem', 'Gain a Mystic Emblem and a Lulu.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2421, 'Nomads', 'ScalescornNomads', 'Scalescorns gain 8% damage each time they start combat in a new hex, stacking up to 4 times. Gain a Lillia.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2410, 'Pandora''s Bench', 'PandorasBench', 'Gain 5 gold. At the start of every round, champions on the 3 rightmost bench slots transform into random champions of the same cost.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2435, 'Party Favors', 'RevelPartyFavors', 'Gain 1 gold for every 6 firecrackers launched by Revel champions each combat. Additionally, gain a special prize the first time 75 total firecrackers are launched. Gain a Jinx.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2479, 'Party Favors', 'RevelPartyFavorsHR', 'Gain 2 gold for every 6 firecrackers launched by Revel champions each combat. Additionally, gain a special prize the first time 40 total firecrackers are launched. Gain a Jinx.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2440, 'Party Time!', 'RevelPartyTime', 'After Revels score a takedown, they gain 80% Attack Speed for 4 seconds. Gain a Jinx.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2447, 'Penitence', 'JadePenitence', 'Enemies are disarmed for 3 seconds the first time they attack a Jade Statue or are damaged by a Jade Statue''s explosion. Gain a Gnar.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2404, 'Personal Training', 'BruiserPersonalTraining', 'At the end of combat, champions that started combat adjacent to Bruisers permanently gain 30 Health, increased by 20 if they survived. Gain a Shen.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2476, 'Personal Training', 'BruiserPersonalTrainerHR', 'At the end of combat, champions that started combat adjacent to Bruisers permanently gain 60 Health, increased by 40 if they survived. Gain a Shen.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (731, 'Phony Frontline', 'TargetDummies', 'Gain 2 Target Dummies.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (699, 'Portable Forge', 'PortableForge', 'Open an Armory and choose 1 of 3 unique Artifacts crafted by Ornn.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2466, 'Preparation II', 'Preparation2', 'Champions on your bench permanently gain 8 Attack Damage and Ability Power every round, up to 32.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2474, 'Preparation II', 'Preparation2HR', 'Champions on your bench permanently gain 10 Attack Damage and Ability Power every round, up to 30.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2401, 'Press the Attack', 'SwiftshotPressTheAttack', 'Your Swiftshots'' attacks apply a stack on their target for 5 seconds. Every third stack deals true damage equal to 5% of the target''s maximum Health. Gain a Twitch.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2363, 'Ragewing Crest', 'RagewingEmblem', 'Gain a Ragewing Emblem and a Kayn.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2448, 'Reckless Spending', 'ShimmerscaleSpending', 'If you purchase both a Shop Refresh and XP during the Planning Phase, Shimmerscale champions gain 50% damage for the next combat. Gain a Kayn.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2385, 'Revel Crest', 'RevelEmblem', 'Gain a Revel Emblem and a Jinx.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2391, 'Revel Unity', 'RevelUnity', 'The Revel trait grants its bonuses to all of your champions. This does not increase your number of Revel units. Gain a Jinx.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (704, 'Rich Get Richer', 'RichGetRicher', 'Gain 10 gold. Your maximum interest is increased to 7.', 2, 7);



INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2455, 'Rich Get Richer+', 'RichGetRicherPlus', 'Gain 15 gold. Your maximum interest is increased to 7.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2422, 'Ricochet', 'CannoneerRicochet', 'Cannoneer''s cannon shots bounce once, dealing 50% less damage. Gain a Tristana.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (705, 'Salvage Bin', 'SalvageBin', 'Gain a random completed item. Selling champions breaks apart their full items into components (excluding Tactician''s Crown).', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2348, 'Scalescorn Crest', 'ScalescornEmblem', 'Gain a Scalescorn Emblem and a Braum.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2446, 'Scorch', 'RagewingScorch', 'Every 5th instance of Ragewing champion''s damage deals 33% more damage and is converted to true damage. Gain a Kayn.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (766, 'Second Wind II', 'SecondWind2', 'After 10 seconds of combat, your units heal 60% of their missing Health.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2379, 'Mage Heart', 'MageTrait', 'Your team counts as having 1 additional Mage. Gain a Nami.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2365, 'Shimmerscale Heart', 'ShimmerscaleTrait', 'Your team counts as having 1 additional Shimmerscale. Gain a Kayn.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (650, 'Stand United II', 'Diversify2', 'Your units gain 3 Attack Damage and Ability Power per Trait active across your army.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (725, 'Sunfire Board', 'SunfireBoard', 'At the start of combat, burn all enemies for 10% of their maximum Health over 15 seconds and reduce healing received by 50%.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2458, 'Tantrum', 'RagewingTantrum', 'After casting their first Ability, Ragewings restore 100% of their maximum Rage. Gain a Kayn.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2354, 'Tempest Crest', 'TempestEmblem', 'Gain a Tempest Emblem and a Qiyana.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (867, 'Three''s Company', 'ThreesCompany', 'Gain 3 random Tier 3 champions.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (734, 'Thrill of the Hunt II', 'ThrillOfTheHunt2', 'Your units heal 700 Health on kill.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2406, 'Tiamat', 'WarriorTiamat', 'Warrior''s enhanced attacks deal 40.0% of their damage to enemies in a 1-hex area around their target. Gain a Yone.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2431, 'Titanic Strength', 'BruiserTitanicStrength', 'Bruisers gain 1.50% of their Health as Attack Damage. Gain a Shen.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (738, 'Trade Sector', 'TradeSector', 'Gain a free Shop refresh each round.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2480, 'Trade Sector+', 'TradeSectorPlus', 'Gain a free Shop refresh every round. Gain 5 gold now.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (851, 'Tri Force II', 'TriForce2', 'Your Tier 3 champions gain 233 Health, 23 starting Mana, and 23% Attack Speed.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (723, 'True Twos', 'TrueTwos', 'Gain a random 2-star Tier 1 champion and a random 2-star Tier 2 champion.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2423, 'Twilight Umbrage', 'WhispersTwillightUmbrage', 'Non-Whispers units that start combat next to Whispers are stealthed for 7 seconds. Gain a Thresh.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2417, 'Urf''s Grab Bag I', 'UrfsGrabBag1', 'Gain 1 Spatula and 1 random item component(s).', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2330, 'Warrior Crest', 'WarriorEmblem', 'Gain a Warrior Emblem and a Shen.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2369, 'Whispers Crest', 'WhispersEmblem', 'Gain a Whispers Emblem and a Thresh.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2405, 'Ancient Archive II', 'TomeOfTraits2', 'Gain 2 Tome of Traits.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (612, 'Assassin Crown', 'AssassinEmblem2', 'Gain an Assassin Emblem, an Infinity Edge, and a Diana.', 3, 7);



INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2340, 'Guild Crown', 'GuildEmblem2', 'Gain a Guild Emblem, a Giant Slayer, and a Ryze.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2386, 'Revel Crown', 'RevelEmblem2', 'Gain a Revel Emblem, a Statikk Shiv, and a Jinx.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2334, 'Astral Soul', 'AstralTrait2', 'Your team counts as having 1 additional Astral. Gain a Redemption and an Illaoi.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (616, 'Band of Thieves II', 'BandOfThieves2', 'Gain 2 Thief''s Gloves.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2400, 'Best Friends III', 'BestFriends3', 'Units isolated in pairs gain 35.0% Attack Speed and 35 Armor at the start of combat.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (617, 'Binary Airdrop', 'BinaryAirdrop', 'Your champions equipped with 2 items temporarily gain a random completed item at the start of combat. Gain a random item component.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (842, 'Bruiser Crown', 'BruiserEmblem2', 'Gain a Bruiser Emblem, a Redemption, and a Sylas.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (741, 'Built Different III', 'Traitless3', 'Your units with no Traits active gain 400-700 Health and 60-90% Attack Speed (based on current Stage).', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2373, 'Cannoneer Crown', 'CannoneerEmblem2', 'Gain a Cannoneer Emblem, a Runaan''s Hurricane, and a Tristana.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2337, 'Cavalier Crown', 'CavalierEmblem2', 'Gain a Cavalier Emblem, a Sunfire Cape, and a Nunu.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2390, 'Cavalier Unity', 'CavalierForAllUnits', 'The Cavalier trait grants its bonuses to all of your champions. This does not increase your number of Cavaliers. Gain a Lillia.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (625, 'Celestial Blessing III', 'CelestialBlessing3', 'Your units heal for 35% of the damage dealt by attacks and Abilities. Excess healing is converted to a shield up to 600 Health.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2408, 'Cruel Pact', 'SacrificialPact', 'Buying XP costs 4 Health instead of gold.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2442, 'Cursed Crown', 'CursedCrown', 'Gain +2 maximum team size, but take 100% increased player damage.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (645, 'Cybernetic Implants III', 'CyberneticImplants3', 'Your champions holding an item gain 300 Health and 30 Attack Damage.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (788, 'Cybernetic Shell III', 'CyberneticShell3', 'Your champions holding an item gain 300 Health and 40 Armor.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (785, 'Cybernetic Uplink III', 'CyberneticUplink3', 'Your champions holding an item gain 300 Health and restore 4 Mana per second.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (870, 'Double Trouble III', 'Twins3', 'If you have exactly 2 copies of a champion on your board, they both gain 50 Attack Damage, Ability Power, Armor, and Magic Resist. When you 3-star, gain a 2-star copy.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2383, 'Dragonmancer Crown', 'DragonmancerEmblem2',  'If you have exactly 2 copies of a champion on your board, they both gain 50 Attack Damage, Ability Power, Armor, and Magic Resist. When you 3-star, gain a 2-star copy.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (764, 'Electrocharge III', 'Electrocharge3', 'When your units receive critical strikes, they deal 115-220 (based on current Stage) magic damage to nearby enemies (1 second cooldown).', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2358, 'Evoker Crown', 'EvokerEmblem2', 'Gain an Evoker Emblem, a Spear of Shojin, and an Anivia.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (648, 'Exiles III', 'Distancing3', 'Your units that start combat with no adjacent allies gain a 50% maximum Health shield for 10 seconds.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (663, 'Featherweights III', 'Featherweights3', 'Your Tier 1 and 2 champions gain 55% Attack Speed and Move Speed.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2462, 'First Aid Kit III', 'FirstAidKit3', 'All healing and shielding on your units is increased by 50.0%.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (850, 'Future Sight II', 'FuturePeepers2', 'Know who you will fight next. Gain a Radiant Zephyr.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2389, 'Guardian Crown', 'GuardianEmblem2', 'Gain a Guardian Emblem, a Gargoyle Stoneplate, and a Braum.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (672, 'High End Shopping', 'HighEndShopping', 'Champions appear in your Shop as if you were 1 level higher. Gain 10 gold.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (667, 'High Roller', 'GrandGambler', 'Gain 3 Loaded Dice and 8 gold.', 3, 7);



INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (683, 'Item Grab Bag II', 'ItemGrabBag2', 'Gain 2 random completed items and 2 Reforgers.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2361, 'Jade Soul', 'JadeTrait2', 'Your team counts as having 1 additional Jade. Gain a Titan''s Resolve and a Gnar.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (687, 'Level Up!', 'MaxLevel10', 'When you buy experience points, gain an additional 3. You can now reach level 10.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2420, 'Living Forge', 'LivingForge', 'Gain a random Ornn artifact now and after every 10 player combats.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2477, 'Living Forge', 'LivingForgeHR', 'Gain a random Ornn artifact now and after every 4 player combats.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (794, 'Luden''s Echo III', 'LudensEcho3', 'When your units cast and deal Ability damage, the first target hit and a nearby enemy take 120-240 (based on current Stage) magic damage.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2381, 'Mage Crown', 'MageEmblem2', 'Gain a Mage Emblem, a Spear of Shojin, and a Sylas.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (686, 'Makeshift Armor III', 'MakeshiftArmor3', 'Your units without items equipped gain 60 Armor and Magic Resist.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (715, 'March of Progress', 'SlowAndSteady', 'Gain 4 bonus experience points per round. You can no longer use gold to level up.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (782, 'Meditation III', 'Meditation3', 'Your units without items equipped restore 8 Mana per second.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2343, 'Mirage Crown', 'MirageEmblem2', 'Gain a Mirage Emblem, a Hand of Justice, and a Nunu.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2376, 'Mystic Soul', 'MysticTrait2', 'Your team counts as having 1 additional Mystic. Gain a Chalice of Power and a Lulu.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (665, 'New Recruit', 'ForceOfNature', 'Gain +1 maximum team size.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2467, 'Preparation III', 'Preparation3', 'Champions on your bench permanently gain 12 Attack Damage and Ability Power every round, up to 48.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2475, 'Preparation III', 'Preparation3HR', 'Champions on your bench permanently gain 15 Attack Damage and Ability Power every round, up to 45.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (755, 'Radiant Relics', 'RadiantRelics', 'Open an Armory and choose 1 of 5 unique Radiant items.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2364, 'Ragewing Crown', 'RagewingEmblem2', 'Gain a Ragewing Emblem, a Guinsoo''s Rageblade, and a Swain.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2349, 'Scalescorn Crown', 'ScalescornEmblem2', 'Gain a Scalescorn Emblem, a Giant Slayer, and a Diana.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2378, 'Shapeshifter Soul', 'ShapeshifterTrait2', 'Your team counts as having 1 additional Shapeshifter. Gain a Hand of Justice and an Elise.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2367, 'Shimmerscale Soul', 'ShimmerscaleTrait2', 'Your team counts as having 1 additional Shimmerscale. Gain a Titan''s Resolve and a Kayn.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (651, 'Stand United III', 'Diversify3', 'Your units gain 4 Attack Damage and Ability Power per Trait active across your army.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2352, 'Swiftshot Crown', 'SwiftshotEmblem2',  'Gain a Swiftshot Emblem, a Guinsoo''s Rageblade, and a Varus.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2355, 'Tempest Crown', 'TempestEmblem2',  'Gain a Tempest Emblem, a Hand of Justice, and a Lee Sin.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (866, 'The Golden Egg', 'TheGoldenEgg', 'Gain a massive golden egg that hatches in 11 turns. Victorious player combats accelerate the hatch timer by an additional turn.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2468, 'The Golden Egg', 'TheGoldenEggHR', 'Gain a massive golden egg that hatches in 6 turns. Victorious player combats accelerate the hatch timer by an additional turn.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2351, 'Swiftshot Crest', 'SwiftshotEmblem', 'Gain an Swiftshot Emblem and an Ashe.', 2, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2393, 'Think Fast', 'ThinkFast', 'Shop refreshes are free until the end of this round. Traits and other augments do not benefit from these free shops. Gain 8 gold.', 3, 7);



INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (735, 'Thrill of the Hunt III', 'ThrillOfTheHunt3', 'Your units heal 900 Health on kill.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (661, 'Tri Force III', 'TriForce3', 'Your Tier 3 champions gain 333 Health, 33 starting Mana, and 33% Attack Speed.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2418, 'Urf''s Grab Bag II', 'UrfsGrabBag2', 'Gain 1 Spatula and 3 random item component(s).', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2471, 'Urf''s Grab Bag II+', 'UrfsGrabBag2Plus', 'Gain 1 Spatula and 3 random item component(s).', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (778, 'Verdant Veil', 'VerdantVeil', 'Your units are immune to crowd control effects for the first 15 seconds of combat.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2331, 'Warrior Crown', 'WarriorEmblem2', 'Gain a Warrior Emblem, a Giant Slayer, and a Yone.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2370, 'Whispers Crown', 'WhispersEmblem2', 'Gain a Whispers Emblem, a Titan''s Resolve, and a Sylas.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (746, 'Windfall', 'Windfall', 'Gain 20 gold.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2463, 'Windfall+', 'WindfallPlus', 'Gain 30 gold.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (2464, 'Windfall++', 'WindfallPlusPlus', 'Gain 40 gold.', 3, 7);

INSERT INTO augments (augment_id, augment_name, augment_api_name, augment_description, augment_tier, augment_set) values (732, 'Wise Spending', 'ThriftShop', 'When you refresh your Shop, gain 2 experience point(s).', 3, 7);

UPDATE augments SET augment_variant='normal' WHERE augment_id IN (2415, 2328, 2333, 2332, 2409, 2437, 2398, 2445, 620, 833, 2371, 2335, 623, 643, 786, 783, 739, 2382, 762, 2356, 656, 845, 664, 2387, 2338, 874, 2360, 2438, 792, 684, 820, 2341, 2374, 698, 2439, 2362, 754, 2384, 2347, 765, 2377, 2366, 649, 2350, 2353, 733, 868, 863, 2329, 745, 2368, 737, 610, 838, 2414, 2416, 2399, 2394, 2465, 758, 2345, 740, 622, 2372, 2336, 624, 637, 2413, 2395, 682, 861, 644, 787, 784, 2412, 869, 2403, 2459, 2460, 763, 2424, 2411, 2317, 647, 2407, 662, 2461, 854, 2402, 2454, 2388, 2339, 2434, 2441, 2443, 673, 2451, 2453, 2359, 771, 2450, 2419, 793, 2444, 2380, 685, 781, 696, 2342, 2375, 2421, 2410, 2435, 2440, 2447, 2404, 731, 699, 2466, 2401, 2363, 2448, 2385, 2391, 704, 2455, 2422, 705, 2348, 2446, 766, 2379, 2365, 650, 725, 2458, 2354, 867, 734, 2480, 851, 723, 2423, 2417, 2330, 2369, 2405, 612, 2340, 2386, 2334, 616, 2400, 617, 842, 741, 2373, 2337, 625, 2408, 2442, 645, 788, 785, 870, 2383, 764, 2358, 648, 663, 2462, 850, 2389, 672, 667, 683, 2361, 687, 2420, 794, 2381, 686, 715, 782, 2343, 2376, 665, 2467, 755, 2364, 2349, 2378, 2367, 651, 2352, 2355, 866, 2351, 2393, 735, 661, 2418, 2471, 778, 2331, 2370, 746, 2463, 2464, 732);

UPDATE augments SET augment_variant='hr' WHERE augment_id IN (2469, 2468, 2475, 2477, 2474, 2476, 2479, 2472, 2478, 2473);








