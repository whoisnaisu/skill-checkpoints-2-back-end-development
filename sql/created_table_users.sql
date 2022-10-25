CREATE TABLE users(
user_id INT PRIMARY KEY generated always as identity,
username varchar ( 25 ) unique NOT NULL,
password varchar ( 25 ) NOT NULL,
firstname varchar ( 100 ) NOT NULL,
lastname varchar ( 100 ) NOT NULL,
email varchar ( 100 ) NOT NULL,
created_at TIMESTAMPTZ NOT NULL
);