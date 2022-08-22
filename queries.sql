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


-- Who was the last animal seen by William Tatcher?
select A.name, Vt.name, V.visit_date from animals A join visits V on V.animal_id = A.id join vets Vt on V.vet_id = Vt.id where Vt.name = 'William Tatcher' order by V.visit_date desc limit 1;
-- How many different animals did Stephanie Mendez see?
select A.name as Animal_name from animals A join visits V on V.animal_id = A.id join vets Vt on V.vet_id = Vt.id where Vt.name = 'Stephanie Mendez' group by A.name;
-- List all vets and their specialties, including vets with no specialties.
select V.name as Vet_name, Sp.name as species from vets V left join specializations S on V.id = S.vet_id left join species Sp on Sp.id = S.specie_id;
-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select A.name as Animal_name, Vt.name as Vet_name, V.visit_date as visit_date from animals A join visits V on V.animal_id = A.id join vets Vt on V.vet_id = Vt.id where Vt.name = 'Stephanie Mendez' and V.visit_date between '2020-04-01' and '2020-08-30';
-- What animal has the most visits to vets?
select A.name, count(*) from visits v join animals A on V.animal_id = A.id group by A.id order by count(*) desc limit 1;
-- Who was Maisy Smith's first visit?
select count(*) from visits V join vets Vt on V.vet_id = Vt.id  join animals A on V.animal_id = A.id join species S on S.id = A.species_id join specializations Sp on Sp.vet_id = Vt.id where Sp.specie_id = A.species_id;
-- Details for most recent visit: animal information, vet information, and date of visit.
select count(*) AS visits_numbers from visits V join animals A on A.id = V.animal_id join vets Vt on Vt.id = V.vet_id where V.vet_id not in (select species_id from specializations where vet_id = Vt.id);
-- How many visits were with a vet that did not specialize in that animal's species?
select count(*), S.name from animals A join visits V on V.animal_id = A.id join vets Vt on V.vet_id = Vt.id join species S on S.id = A.species_id where Vt.name = 'Maisy Smith' group by S.name;
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
select * from visits V join animals A on V.animal_id = A.id join vets Vt on V.vet_id = Vt.id order by V.visit_date desc limit 1;


-- Test 1
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits
where animal_id = 4;

-- Test 2
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;

-- Test 3
EXPLAIN ANALYZE SELECT * FROM owners
where email = 'owner_18327@mail.com';
