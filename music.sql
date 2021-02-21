-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  release_date DATE
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE songs_albums (
  song_id INTEGER NOT NULL REFERENCES songs(id) ON DELETE CASCADE,
  album_id INTEGER NOT NULL REFERENCES albums(id) ON DELETE CASCADE
);

CREATE TABLE songs_artists (
  song_id INTEGER NOT NULL REFERENCES songs(id) ON DELETE CASCADE,
  artist_id INTEGER NOT NULL REFERENCES artists(id) ON DELETE CASCADE
);

CREATE TABLE producers_songs (
  song_id INTEGER NOT NULL REFERENCES songs(id) ON DELETE CASCADE,
  producer_id INTEGER NOT NULL REFERENCES producers ON DELETE CASCADE
);

INSERT INTO artists (name)
VALUES
('Hanson'),
('Queen'),
('Mariah Carey'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');

INSERT INTO albums (name)
VALUES
('Middle of Nowhere'),
('A Night at the Opera'),
('Daydream'),
('A Star Is Born'),
('Silver Side Up'),
('The Blueprint 3'),
('Prism'),
('Hands All Over'),
('Let Go'),
('The Writing''s on the Wall');

INSERT INTO producers(name)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'), 
('Cirkut'),
('Shellback'), 
('Benny Blanco'),
('The Matrix'),
('Darkchild');

INSERT INTO songs
  (title, duration_in_seconds, release_date)
VALUES
('MMMBop', 238, '04-15-1997'),
('Bohemian Rhapsody', 355, '10-31-1975'),
('One Sweet Day', 282, '11-14-1995'),
('Shallow', 216, '09-27-2018'),
('How You Remind Me', 223, '08-21-2001'),
('New York State of Mind', 276, '10-20-2009'),
('Dark Horse', 215, '12-17-2013'),
('Moves Like Jagger', 201, '06-21-2011'),
('Complicated', 244, '05-14-2002'),
('Say My Name', 240, '11-07-1999');

INSERT INTO songs_albums (song_id, album_id)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO songs_artists (song_id, artist_id)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 7),
(6, 8),
(6, 9),
(7, 10),
(7, 11),
(8, 12),
(8, 13),
(9, 14),
(10, 15);

INSERT INTO producers_songs (song_id, producer_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(7, 9),
(8, 10),
(8, 11),
(9, 12),
(10, 13);
