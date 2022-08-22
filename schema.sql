/* Database schema to keep the structure of entire database. */
-- judah is on

create table animals(id integer, name text, date_of_birth date, escape_attempts integer, neutered boolean, weight_kg decimal);

alter table animals add column species text;

create table owners(id int generated always as identity, full_name text, age int);

create table species(id int generated always as identity, name text);

alter table animals alter column id set not null;
alter table animals alter column id add generated by default as identity;

alter table animals drop column species;

alter table species add primary key (id);

alter table animals add column species_id int references species(id);

alter table owners add primary key (id);

alter table animals add column owner_id int references owners(id);

create table vets(id int generated always as identity primary key, name text, age int, date_of_graduation date);

create table specializations(specie_id int, vet_id int, constraint fk_species foreign key (specie_id) references species(id), constraint fk_vets foreign key (vet_id) references vets(id));

create table visits(animal_id int, vet_id int, visit_date date, constraint fk_animals foreign key (animal_id) references animals(id), constraint fk_vets foreign key (vet_id) references vets(id));

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

DROP INDEX owners_fullName_asc;

-- Test 1: create index for visit_date
CREATE INDEX visits_visit_date
ON visits(date_of_visit ASC);

-- Test 2: create index for ??
CREATE INDEX visits_vet_id
ON visits(vet_id ASC);

-- Test 3: create index for owners_full_name
CREATE INDEX owners_fullName_asc
ON owners(full_name ASC);
