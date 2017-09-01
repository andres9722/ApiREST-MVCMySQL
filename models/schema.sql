DROP DATABASE IF EXISTS indentation_war;

CREATE DATABASE IF NOT EXISTS indentation_war;

USE indentation_war;

CREATE TABLE team(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    twitter VARCHAR(50) NOT NULL,
    country VARCHAR(20) NOT NULL,
    side VARCHAR(10) NOT NULL
);