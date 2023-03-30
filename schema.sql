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
    name VARCHAR);

ALTER TABLE animals

DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

CREATE TABLE vets( id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name VARCHAR(150), age INT, date_of_graduation DATE );

CREATE TABLE specializations ( vet_id INT, species_id INT, PRIMARY KEY (vet_id, species_id), CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id), CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id) );

CREATE TABLE visits( vet_id INT, animal_id INT, date_of_visit DATE, PRIMARY KEY (vet_id, animal_id, date_of_visit), CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id), CONSTRAINT fk_animals FOREIGN KEY (animal_id) REFERENCES animals(id) );