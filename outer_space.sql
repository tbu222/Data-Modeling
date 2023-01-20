-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  name TEXT,
  moons TEXT[]
);

CREATE TABLE orbits(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets ON DELETE SET NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL 
);

CREATE TABLE galaxy(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets ON DELETE SET NULL,
  galaxy TEXT NOT NULL
);

INSERT INTO planets(name, moons) VALUES('Earth','{"The Moon"}'),('Mars','{"Phobos", "Deimos"}');
INSERT INTO orbits(planet_id,orbital_period_in_years,orbits_around) VALUES('1',1.00,'The Sun'),('2',1.88, 'The Sun');
INSERT INTO galaxy(planet_id,galaxy) VALUES('1','Milky Way'),('2', 'Milky Way');
-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );


-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');