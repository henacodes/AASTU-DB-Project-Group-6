INSERT INTO student(full_name, department)
VALUE
('Elroy melaku,Software Engineering'),
('Elshaday Alem,Software Engineering'),
('Elisabeth alemneh,Software Engineering'),
('Elyas demamu,Software Engineering'),
('Henok ,Software Engineering'),
('kidus ,Software Engineering');

INSERT INTO meals_session(session_name, start_time, end_time)
VALUE
('Breakfast','07:00:00','09:00:00'),
('Lunch','12:00:00','14:00:00'),
('Dinner','18:00:00','20:00:00');

INSERT INTO menu(day_of_week, food_items, session_id)
VALUE
('Monday'frfr'',1);

INSERT INTO meal_transaction(student_id, session_id, scan_timestamp, status)
VALUE
(1,1,NOW(),'Success'),
(1,1,NOW(),'Duplicate Attempt'),
(2,2,NOW(),'Success');

SELECT * FROM users;
SELECT * FROM meals_session;
SELECT
student.full_name,
meals_session.session_name,
meal_transaction.scan_timestamp,
FROM meal_transaction
JOIN student
on meal_transaction.student_id = student.student_id
JOIN meals_session
ON meal_transaction.session_id = meals_session.session_id;