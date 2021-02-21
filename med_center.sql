CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    hire_date DATE,
    type TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    check_in TIMESTAMP
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    primary_treatment TEXT,
    secondary_treatment TEXT
);

CREATE TABLE doctors_patients (
    doc_id INTEGER REFERENCES doctors(id) ON DELETE CASCADE,
    pat_id INTEGER REFERENCES patients(id) ON DELETE CASCADE
);

CREATE TABLE patients_diseases (
    pat_id INTEGER REFERENCES patients(id) ON DELETE CASCADE,
    dis_id INTEGER REFERENCES diseases(id) ON DELETE CASCADE
);