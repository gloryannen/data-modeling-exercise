CREATE TABLE players (
    id SERIAL PRIMARY KEY NOT NULL,
    name string NOT NULL,
    team_id NOT NULL REFERENCES teams
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY NOT NULL,
    name string NOT NULL,
);

CREATE TABLE goals (
    id SERIAL PRIMARY NOT NULL,
    player_id NOT NULL REFERENCES players,
    match_id NOT NULL REFERENCES matches
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY NOT NULL,
    name string NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY NOT NULL,
    date DATE NOT NULL,
    location string NOT NULL,
    team_id NOT NULL REFERENCES teams,
    referee_id NOT NULL REFERENCES referees,
    season_id NOT NULL REFERENCES season
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE rankings (
    id SERIAL PRIMARY KEY NOT NULL,
    match_id NOT NULL REFERENCES matches,
    team_id NOT NULL REFERENCES teams,
    result string NOT NULL
);

CREATE TABLE teamVSteam (
    id SERIAL PRIMARY KEY NOT NULL,
    team_id  NOT NULL REFERENCES teams,
    player_id  NOT NULL REFERENCES players,
    match_id  NOT NULL REFERENCES matches
);