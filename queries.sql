/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-12-31' AND '2019-01-01';
SELECT * FROM animals WHERE neutered = true and escape_attempts < 2;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' or name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name not in ('Gabumon');
SELECT * FROM animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;

begin;
update animals set species = 'unspecified';
select * from animals;
rollback;

begin;
update animals set species = 'digimon' where name like '%mon';
select * from animals;
update animals set species = 'pokemon' where species is null;
commit;

begin;
delete from animals;
select * from animals;
rollback;

begin;
delete from animals where date_of_birth > '2022-01-01';
select * from animals;
savepoint sp1;
update animals set weight_kg = (weight_kg * (-1));
rollback to sp1;
select * from animals;
update animals set weight_kg = (weight_kg * (-1)) where weight_kg < 0;
select * from animals;
commit;
select * from animals;

-- How many animals are there?
select count(*) from animals;
-- How many animals have never tried to escape?
select count(*) from animals where escape_attempts = 0;
-- What is the average weight of animals?
select avg(weight_kg) from animals;
-- Who escapes the most, neutered or not neutered animals?
select * from animals order by escape_attempts desc;
-- What is the minimum and maximum weight of each type of animal?
select species, min(weight_kg), max(weight_kg) from animals group by species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
select species, avg(escape_attempts) from animals where date_of_birth between '1990-12-31' and '2000-01-01' group by species;


-- What animals belong to Melody Pond?
select * from animals A join owners O on O.id = A.owner_id where O.full_name = 'Melody Pond';
-- List of all animals that are pokemon (their type is Pokemon).
select * from animals A join species S on S.id = A.species_id where S.name = 'Pokemon';
-- List all owners and their animals, remember to include those that don't own any animal.
select * from owners O left join animals A on O.id = A.owner_id;
-- How many animals are there per species?
select S.name, count(*) from animals A join species S on A.species_id = S.id group by S.name;
-- List all Digimon owned by Jennifer Orwell.
select * from animals A join owners O on O.id = A.owner_id join species S on S.id = A.species_id where O.full_name = 'Jennifer Orwell' and S.name = 'Digimon';
-- List all animals owned by Dean Winchester that haven't tried to escape.
select A.name from animals A join owners O on O.id = A.owner_id where O.full_name = 'Dean Winchester' and A.escape_attempts = 0;
-- Who owns the most animals?
select O.full_name, count(*) from owners O left join animals A on O.id = A.owner_id group by O.full_name order by count(*) desc;