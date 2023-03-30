/* Database schema to keep the structure of entire database. */

CREATE TABLE animals ( 
    id integer, 
    name text, 
    date_of_birth date, 
    escape_attempts integer, 
    neutered boolean, 
    weight_kg decimal 
    );

ALTER TABLE animals ADD species text

CREATE TABLE owners ( 
    id SERIAL NOT NULL PRIMARY KEY, 
    full_name VARCHAR, 
    age integer
    );

CREATE TABLE species ( 
    id SERIAL NOT NULL PRIMARY KEY, 
    name VARCHAR
    );

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);
