-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;
\c outer_space;


CREATE TABLE galaxy(
  id SERIAL PRIMARY KEY NOT NULL,
  name TEXT
);

CREATE TABLE stars(
  id SERIAL PRIMARY KEY NOT NULL,
  name TEXT,
  galaxy_id INT REFERENCES galaxy
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  star_id INT REFERENCES stars
);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  planet_id INT REFERENCES planets
);

INSERT INTO galaxy
(name)
VALUES
('Milky Way');

INSERT INTO stars
(name, galaxy_id)
VALUES
('The Sun', 1),
('Proxima Centauri', 1);

INSERT INTO planets
  (name, orbital_period_in_years, star_id)
VALUES
  ('Earth', 1.00, 1),
  ('Mars', 1.88, 1),
  ('Venus', 0.62, 1),
  ('Neptune', 164.8, 1),
  ('Proxima Centauri b', 0.03, 2),
  ('Gliese 876 b', 0.23, 1);

INSERT INTO moons
(name, planet_id)
VALUES
('Naiad', 4),
('Thalassa', 4),
('Despina', 4),
('Galatea', 4),
('Larissa', 4),
 ('S/2004 N 1', 4),
 ('Proteus', 4),
 ('Triton', 4),
 ('Nereid', 4),
 ('Halimede', 4),
 ('Sao', 4),
 ('Laomedeia', 4),
 ('Psamathe', 4),
 ('Neso', 4),
 ('Phobos', 2),
 ('Deimos', 2),
 ('The Moon', 1);
