CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO users (id, username, email) VALUES (1, 'john_doe', 'john@example.com');