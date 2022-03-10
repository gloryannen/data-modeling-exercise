CREATE TABLE users (
    id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL,
    preferred_region_id INTEGER REFERENCES region
);

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(15) NOT NULL,
    text TEXT NOT NULL,
    date DATE NOT NULL,
    location TEXT NOT NULL,
    user_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES regions,
    category_id INTEGER REFERENCES categories
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT NOT NULL
);

