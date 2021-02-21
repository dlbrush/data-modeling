CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    email TEXT,
    preferred_region INTEGER REFERENCES regions(id) ON DELETE SET NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    post_text TEXT DEFAULT 'No description provided',
    location TEXT,
    posted_by INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    cat_id INTEGER REFERENCES categories(id) ON DELETE SET NULL,
    region_id INTEGER REFERENCES regions(id) ON DELETE SET NULL
);