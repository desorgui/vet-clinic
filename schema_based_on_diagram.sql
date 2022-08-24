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

CREATE TABLE treatments (
  id integer GENERATED ALWAYS AS IDENTITY,
  type TEXT,
  name TEXT,
  primary key (id)
);

CREATE TABLE invoice_items (
  id integer GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL,
  quantity integer,
  total_price DECIMAL,
  invoice_id integer REFERENCES invoices(id),
  treatment_id integer REFERENCES treatments(id),
  PRIMARY KEY (id)
);

CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);

CREATE TABLE medical_treatments (
  medical_id integer REFERENCES medical_histories(id),
  treatment_id integer REFERENCES treatments(id),
  PRIMARY KEY (medical_id, treatment_id)
);

CREATE INDEX ON medical_treatments (medical_id);
CREATE INDEX ON medical_treatments (treatment_id);
