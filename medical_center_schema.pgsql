CREATE TABLE doctors (
    id SERIAL PRIMARY KEY NOT NULL,
    name string   NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    birth_date DATE NOT NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY NOT NULL,
    date DATE NOT NULL,
    reason TEXT NOT NULL,
    doctor_id NOT NULL REFERENCES doctors,
    patient_id NOT NULL REFERENCES patients
);

CREATE TABLE diagnose (
    id SERIAL PRIMARY KEY NOT NULL,
    disease_id NOT NULL REFERENCES diseases,
    visit_id NOT NULL REFERENCES visits
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT UNIQUE NOT NULL
);
