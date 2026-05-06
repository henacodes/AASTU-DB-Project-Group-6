CREATE DATABASE cafeteria_system;
USE cafeteria_system;

CREATE TABLE users (
    student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL ,
    department VARCHAR(100) NOT NULL
);

CREATE TABLE meals_session (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    session_name VARCHAR(50) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);
 CREATE TABLE menu(
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    day_of_week VERHAR(20),
    food_items TEXT,
    session_id INT,

    FOREIGN KEY (session_id)
    REFERENCES meal_session(session_id)
 );

CREATE TABLE meal_transaction(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
   session_id INT,
   scan_timestamp DATETIME,
   status VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES users(student_id),
    FOREIGN KEY (session_id) REFERENCES meals_session(session_id)
)


