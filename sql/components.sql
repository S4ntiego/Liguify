    CREATE TABLE components (
    component_id SERIAL NOT NULL PRIMARY KEY,
    component_name VARCHAR(255),
    component_statistics TEXT
);

INSERT INTO components (component_name, component_statistics) values ('B.F Sword', '+10 Attack Damage');

INSERT INTO components (component_name, component_statistics) values ('Recurve Bow', '+10% Attack Speed');

INSERT INTO components (component_name, component_statistics) values ('Tear of the Goddess', '+15 Mana');

INSERT INTO components (component_name, component_statistics) values ('Chain Vest', '+20 Armor');

INSERT INTO components (component_name, component_statistics) values ('Negatron Cloak', '+20 Magic Resist');

INSERT INTO components (component_name, component_statistics) values ('Giant''s Belt', '+150 Health');

INSERT INTO components (component_name, component_statistics) values ('Sparring Gloves', '+5% Critical Strike Chance

+10% Dodge Chance');

INSERT INTO components (component_name, component_statistics) values ('Spatula', 'It must do something...');

INSERT INTO components (component_name, component_statistics) values ('Needlessly Large Rod', '+10 Ability Power');

    CREATE TABLE items_components (
    component_id SERIAL NOT NULL PRIMARY KEY,
    component_name VARCHAR(255),
    component_statistics TEXT
    CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES items (item_id)
);


