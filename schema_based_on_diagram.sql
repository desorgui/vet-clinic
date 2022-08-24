CREATE DATABASE clinic;

CREATE TABLE patients (
  id integer GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY (id)
);