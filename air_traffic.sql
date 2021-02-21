-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries(id) ON DELETE SET NULL
);

CREATE TABLE seats (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  seat_id INTEGER REFERENCES seats(id) ON DELETE SET NULL,
  airline_id INTEGER NOT NULL REFERENCES airlines(id) ON DELETE CASCADE,
  from_city_id INTEGER NOT NULL REFERENCES cities(id) ON DELETE CASCADE,
  to_city_id INTEGER NOT NULL REFERENCES cities(id) ON DELETE CASCADE
);

INSERT INTO countries (name)
VALUES
('United States'),
('United Kingdom'),
('Mexico'),
('Morocco'),
('China'),
('Chile'),
('Japan'),
('France'),
('UAE'),
('Brazil');

INSERT INTO cities (name, country_id)
VALUES
('Seattle', 1),
('Washington DC', 1),
('London', 2),
('Tokyo', 7),
('Paris', 8),
('Los Angeles', 1),
('Las Vegas', 1),
('Mexico City', 3),
('Casablanca', 4),
('Dubai', 9),
('Beijing', 5),
('New York', 1),
('Charlotte', 1),
('Cedar Rapids', 1),
('New Orleans', 1),
('Sao Paolo', 10),
('Santiago', 6),
('Chicago', 1);

INSERT INTO seats (name)
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
('10D');

INSERT INTO airlines (name)
VALUES 
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');


INSERT INTO tickets
  (first_name, last_name, seat_id, departure, arrival, airline_id, from_city_id, to_city_id)
VALUES
  ('Jennifer', 'Finch', 1, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 2, 1),
  ('Thadeus', 'Gathercoal', 2, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 4, 3),
  ('Sonja', 'Pauley', 3, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 6, 7),
  ('Jennifer', 'Finch', 4, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 1, 8),
  ('Waneta', 'Skeleton', 5, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 9),
  ('Thadeus', 'Gathercoal', 6, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 11),
  ('Berkie', 'Wycliff', 7, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 13),
  ('Alvin', 'Leathes', 8, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 18),
  ('Berkie', 'Wycliff', 9, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 15),
  ('Cory', 'Squibbes', 10, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 16, 17);