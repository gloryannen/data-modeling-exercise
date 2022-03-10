-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic

CREATE TABLE person(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
);

CREATE TABLE seats(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  person_id INT REFERENCES person NOT NULL,
  airline_id  INT REFERENCES airlines NOT NULL,
  seat_id INT REFERENCES seats NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city_id INT REFERENCES cities NOT NULL,
  from_country_id INT REFERENCES countries NOT NULL,
  to_city_id INT REFERENCES cities NOT NULL,
  to_country_id INT REFERENCES countries NOT NULL
);

INSERT INTO person
(first_name, last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes')
;

INSERT INTO airlines
(name)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil')
;

INSERT INTO seats
(name)
VALUES
('33B'),
('8A'),
('12F'),
('20A'),
('23D'),
('18C'),
('9E'),
('1A'),
('32B'),
('10D')
;

INSERT INTO countries
(name)
VALUES
('United States'),
('Japan'),
('United Kingdom'),
('Mexico'),
('France'),
('Morocco'),
('UAE'),
('China'),
('Brazil'),
('Chile')
;

INSERT INTO cities
(name)
VALUES
('Washington DC'),
('Tokyo'),
('Los Angeles'),
('Seattle'),
('Paris'),
('London'),
('Las Vegas'),
('Casablanca'),
('Dubai'),
('Beijing'),
('New York'),
('Charlotte'),
('Cedar Rapids'),
('Chicago'),
('Sao Paolo'),
('Santiago'),
('New Orleans'),
('Mexico City')
;

INSERT INTO tickets
(person_id, airline_id, seat_id, arrival, departure, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
(1, 1, 1, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 4, 1 ),
(2, 2, 2, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 6, 3 ),
(3, 3, 3, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 1, 7, 1 ),
(1, 3, 4, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 4, 1, 18, 4 ),
(4, 4, 5, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 5, 5, 8, 6 ),
(2, 5, 6, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 9, 7, 10, 8 ),
(5, 1, 7, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 11, 1, 12, 1 ),
(6, 6, 8, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 13, 1, 14, 1 ),
(5, 6, 9, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 12, 1, 17, 1 ),
(7, 7, 10, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 15, 9, 16, 10 )
;
