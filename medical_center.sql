DROP DATABASE IF EXISTS medicalcenter_db;
CREATE DATABASE medicalcenter_db;
\c medicalcenter_db;

CREATE TABLE Doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE Patients (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    insurance TEXT NOT NULL,
    birthday DATE NOT NULL
);

CREATE TABLE Visits (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    patient_id INTEGER REFERENCES Patients ON DELETE SET NULL,
    doctor_id INTEGER REFERENCES Doctors ON DELETE SET NULL
);

CREATE TABLE Diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE Diagnoses 
(
    id SERIAL PRIMARY KEY,
    notes TEXT NOT NULL,
    visit_id INTEGER REFERENCES Visits ON DELETE SET NULL,
    disease_id INTEGER REFERENCES Diseases ON DELETE SET NULL
);
INSERT INTO Doctors(name, specialty) VALUES('kent', 'operate on death body');
INSERT INTO Patients(name, insurance, birthday) VALUES('Clark', 'Etna', '1916-02-02');
INSERT INTO Visits(DATE, patient_id, doctor_id) VALUES('2016-02-02', '1','1');
INSERT INTO Diseases(name, description) VALUES('death','not breathe');
INSERT INTO Diagnoses(notes, visit_id, disease_id) VALUES('null','1','1');


