DROP DATABASE IF EXISTS soccer_db;
CREATE DATABASE soccer_db;
\c soccer_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name text,
    city text
);

CREATE TABLE Referees (
    id SERIAL PRIMARY KEY,
    name text
);
CREATE TABLE Season (
    id SERIAL PRIMARY KEY,
    start_date date,
    end_date date
);
CREATE TABLE Matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    season_id INTEGER REFERENCES season ON DELETE SET NULL,
    away_team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    head_referee_id INTEGER REFERENCES referees ON DELETE SET NULL,
    assistant_referee_2_id INTEGER REFERENCES referees ON DELETE SET NULL,
    assistant_referee_1_id INTEGER REFERENCES referees ON DELETE SET NULL,
    location text,
    date date,
    start_time timestamp

);
CREATE TABLE Results (
    id SERIAL PRIMARY KEY,
    result varchar,
    team_id INTEGER REFERENCES Teams ON DELETE SET NULL,
    match_id INTEGER REFERENCES Matches ON DELETE SET NULL
);

CREATE TABLE Players (
    id SERIAL PRIMARY KEY,
    name text,
    birthday date,
    height float
);

CREATE TABLE Lineups (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE SET NULL,
    match_id INTEGER REFERENCES matches ON DELETE SET NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);



CREATE TABLE Goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE SET NULL,
    match_id INTEGER REFERENCES matches ON DELETE SET NULL
);
INSERT INTO referees(name) VALUES('kent');
INSERT INTO teams(name, city) VALUES('manu','los angeles');
INSERT INTO Season(start_date, end_date) VALUES('2016-02-02', '2016-02-03');
INSERT INTO players(name,birthday, height) VALUES('clark','1916-02-02','175');
INSERT INTO matches(home_team_id,season_id,away_team_id,head_referee_id,assistant_referee_1_id,assistant_referee_2_id,location,date,start_time) VALUES('1','1','1','1','1','1','los angeles', '2016-02-02', '2016-02-02 09:00:00');
INSERT INTO Goals(player_id, match_id) VALUES('1','1');
INSERT INTO Lineups(player_id, match_id, team_id) VALUES('1','1','1');
INSERT INTO Results(result, team_id,match_id) VALUES('w','1','1');


