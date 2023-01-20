DROP DATABASE IF EXISTS craig_db;
CREATE DATABASE craig_db;
\c craig_db;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE Categories (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT,
    preferred_region_id INTEGER REFERENCES regions ON DELETE SET NULL,
    encrypted_password varchar(15)
);
CREATE TABLE Posts (
    id SERIAL PRIMARY KEY,
    title TEXT,
    text TEXT,
    location TEXT,
    user_id INTEGER REFERENCES users ON DELETE SET NULL,
    region_id INTEGER REFERENCES regions ON DELETE SET NULL,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL
);



INSERT INTO categories(name) VALUES('food');
INSERT INTO regions(name) VALUES('Orange County');
INSERT INTO users(username, preferred_region_id,encrypted_password) VALUES('tester', '1', 'abc');

INSERT INTO POSTs(title, TEXT, location, user_id, region_id, category_id) VALUES('title test', 'abcxtz','Los Angeles','1','1','1')