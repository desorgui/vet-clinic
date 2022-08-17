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