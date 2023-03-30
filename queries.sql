/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- TRANSACTONS
BEGIN TRANSACTION;

UPDATE animals
SET species = 'unspecified';
SELECT species FROM animals
ROLLBACK;
SELECT species FROM animals
-----
BEGIN TRANSACTION;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT species FROM animals
COMMIT;
SELECT species FROM animals

BEGIN TRANSACTION;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals


BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;




SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


-- Queries
SELECT name FROM animals LEFT JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT * FROM animals LEFT JOIN species ON animals.species_id = species_id WHERE species.id = 1;
SELECT * FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
SELECT species.name, COUNT(*) FROM animals LEFT JOIN species ON animals.species_id = species.id GROUP BY species.name;

SELECT animals.name AS "Animal", owners.full_name AS "Owner", species.name AS "Species" FROM animals LEFT JOIN owners ON animals.owner_id = owners.id LEFT JOIN species 
ON animals.species_id = species.id WHERE full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.name AS "Animal", owners.full_name AS "Owner" FROM animals LEFT JOIN owners ON animals.owner_id = owners.id WHERE escape_attempts = 0 AND 
full_name = 'Dean Winchester';

SELECT full_name, COUNT(*) FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY full_name ORDER BY COUNT(*) DESC LIMIT 1;  