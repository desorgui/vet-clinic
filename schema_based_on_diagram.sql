CREATE DATABASE clinic;

CREATE TABLE patients (
  id integer GENERATED ALWAYS AS IDENTITY,
  name TEXT NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
  id integer GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id integer REFERENCES patients(id),
  status varchar(255),
  PRIMARY KEY(id)
);

CREATE INDEX ON medical_histories (patient_id);

CREATE TABLE invoices (
  id integer GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL NOT NULL,
  generated_at TIMESTAMP NOT NULL, 
  payed_at TIMESTAMP NOT NULL,
  medical_history_id INT NOT NULL REFERENCES medical_histories(id),
  PRIMARY KEY (id)
);

CREATE INDEX ON invoices (medical_history_id);
