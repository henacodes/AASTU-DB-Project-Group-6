CREATE DATABASE cafeteria_system;
USE cafeteria_system;

CREATE TABLE users (
    STUDENT_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL ,
    department VARCHAR(100) NOT NULL
);

CREATE TABLE meals_session (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    session_name VARCHAR(50) NOT NULL
    
);