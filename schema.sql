/* Database schema to keep the structure of entire database. */

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

alter table animals add column owners_id int references owners(id);