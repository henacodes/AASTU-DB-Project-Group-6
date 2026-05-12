CREATE DATABASE IF NOT EXISTS cafeteria_system;
USE cafeteria_system;

CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL
);

CREATE TABLE meal_session (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    session_name ENUM('Breakfast', 'Lunch', 'Dinner') NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);

CREATE TABLE menu (
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    session_id INT NOT NULL,
    menu_date DATE NOT NULL,
    food_items TEXT NOT NULL,
    CONSTRAINT fk_menu_session
        FOREIGN KEY (session_id) REFERENCES meal_session(session_id),
    CONSTRAINT uq_menu_session_date
        UNIQUE (session_id, menu_date)
);

CREATE TABLE meal_transaction (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    session_id INT NOT NULL,
    transaction_date DATE NOT NULL,
    scan_timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Success', 'Duplicate Attempt') NOT NULL DEFAULT 'Success',

    CONSTRAINT fk_transaction_student
        FOREIGN KEY (student_id) REFERENCES student(student_id),
    CONSTRAINT fk_transaction_session
        FOREIGN KEY (session_id) REFERENCES meal_session(session_id),

    -- ERD business constraint: one transaction per student/session/day
    CONSTRAINT uq_student_session_date
        UNIQUE (student_id, session_id, transaction_date)
);