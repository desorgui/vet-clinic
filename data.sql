/* Populate database with sample data. */

insert into animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) values(1, 'Agumon', '2020-02-03', 0, true, 10.23);
insert into animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) values(2, 'Gabumon', '2018-11-15', 2, true, 8);
insert into animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) values(3, 'Pikachu', '2021-01-07', 1, false, 15.04);
insert into animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) values(4, 'Devimon', '2017-05-12', 5, true, 11);

insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) values (5, 'Charmander', '02-8-2020', 0, false, -11);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) values (6, 'Plantmon', '11-15-2021', 2, true, -5.7);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) values (7, 'Squirtle', '04-02-1993', 3, false, -12.13);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) values (8, 'Angemon', '06-12-2005', 1, true, -45);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) values (9, 'Boarmon', '06-07-2005', 7, true, 20.4);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) values (10, 'Blossom', '10-13-1998', 3, true, 17);
insert into animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) values (11, 'Ditto', '05-14-2022', 4, true, 22);

insert into owners(full_name, age) values ('Sam Smith', 34);
insert into owners(full_name, age) values ('Jennifer Orwell', 19);
insert into owners(full_name, age) values ('Bob', 45);
insert into owners(full_name, age) values ('Melody Pond', 77);
insert into owners(full_name, age) values ('Dean Winchester', 14);
insert into owners(full_name, age) values ('Jodie Whittaker', 38);

insert into species(name) values ('Pokemon');
insert into species(name) values ('Digimon');

update animals set species_id = (select id from species where name = 'Digimon') where name like '%mon';

update animals set species_id = (select id from species where name = 'Pokemon') where species_id is null;

update animals set owner_id = (select id from owners where full_name = 'Sam Smith') where name = 'Agumon';

update animals set owner_id = (select id from owners where full_name = 'Jennifer Orwell') where name = 'Gabumon' or name = 'Pikachu';

update animals set owner_id = (select id from owners where full_name = 'Bob') where name = 'Devimon' or name = 'Plantmon';

update animals set owner_id = (select id from owners where full_name = 'Melody Pond') where name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';

update animals set owner_id = (select id from owners where full_name = 'Dean Winchester') where name = 'Angemon' or name = 'Boarmon';


insert into vets(name, age, date_of_graduation) values ('William Tatcher', 45, '2000-04-23');
insert into vets(name, age, date_of_graduation) values ('Maisy Smith', 26, '2019-01-17');
insert into vets(name, age, date_of_graduation) values ('Stephanie Mendez', 64, '1981-05-04');
insert into vets(name, age, date_of_graduation) values ('Jack Harkness', 38, '2008-06-08');


-- create table specializations(id int generated always as identity primary key, specie_id int, vet_id int);

-- create table visits(id int generated always as identity primary key, animal_id int, vet_id int,visit_date date);
insert into specializations(specie_id, vet_id) values (1, 1);
insert into specializations(specie_id, vet_id) values (2, 3);
insert into specializations(specie_id, vet_id) values (1, 3);
insert into specializations(specie_id, vet_id) values (2, 4);

insert into visits(animal_id, vet_id, visit_date) values (1, 1, '2020-05-24');
insert into visits(animal_id, vet_id, visit_date) values (1, 3, '2020-07-22');
insert into visits(animal_id, vet_id, visit_date) values (2, 4, '2020-02-02');
insert into visits(animal_id, vet_id, visit_date) values (3, 2, '2020-01-05');
insert into visits(animal_id, vet_id, visit_date) values (3, 2, '2020-03-08');
insert into visits(animal_id, vet_id, visit_date) values (3, 2, '2020-05-14');
insert into visits(animal_id, vet_id, visit_date) values (4, 3, '2021-05-04');
insert into visits(animal_id, vet_id, visit_date) values (5, 4, '2021-02-24');
insert into visits(animal_id, vet_id, visit_date) values (6, 2, '2019-12-21');
insert into visits(animal_id, vet_id, visit_date) values (6, 1, '2020-08-10');
insert into visits(animal_id, vet_id, visit_date) values (6, 2, '2021-04-07');
insert into visits(animal_id, vet_id, visit_date) values (7, 3, '2019-09-29');
insert into visits(animal_id, vet_id, visit_date) values (8, 4, '2020-11-03');
insert into visits(animal_id, vet_id, visit_date) values (8, 4, '2020-11-04');
insert into visits(animal_id, vet_id, visit_date) values (9, 2, '2019-01-24');
insert into visits(animal_id, vet_id, visit_date) values (9, 2, '2019-05-15');
insert into visits(animal_id, vet_id, visit_date) values (9, 2, '2020-02-27');
insert into visits(animal_id, vet_id, visit_date) values (9, 2, '2020-08-03');
insert into visits(animal_id, vet_id, visit_date) values (10, 3, '2020-05-24');
insert into visits(animal_id, vet_id, visit_date) values (10, 1, '2021-01-11');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
SELECT * FROM (SELECT id FROM animals)
animal_ids,
(SELECT id FROM vets)
vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours')
visit_timestamp;

insert into owners (full_name, email)
select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

SELECT * FROM owners;