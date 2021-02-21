CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT NOT NULL,
    hired_on DATE
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    location TEXT
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT NOT NULL,
    jersey_num INTEGER,
    current_team INTEGER REFERENCES teams(id) ON DELETE SET NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    match_date DATE NOT NULL,
    location TEXT,
    team1 INTEGER NOT NULL REFERENCES teams(id),
    team2 INTEGER NOT NULL REFERENCES teams(id),
    season_id INTEGER REFERENCES seasons(id)
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    minute INTEGER NOT NULL,
    player_id INTEGER NOT NULL REFERENCES players(id),
    match_id INTEGER NOT NULL REFERENCES matches(id),
    team_id INTEGER NOT NULL REFERENCES teams(id)
);
