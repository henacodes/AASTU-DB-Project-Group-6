INSERT INTO student (full_name, department) VALUES
('Elroy Melaku', 'Software Engineering'),
('Elshaday Alem', 'Software Engineering'),
('Elisabeth Alemneh', 'Software Engineering'),
('Elyas Demamu', 'Software Engineering'),
('Henok Tadesse', 'Software Engineering'),
('Kidus Bekele', 'Software Engineering'),
('Sara Mohammed', 'Computer Science'),
('Abel Tesfaye', 'Information Systems');

INSERT INTO meal_session (session_name, start_time, end_time) VALUES
('Breakfast', '07:00:00', '09:00:00'),
('Lunch', '12:00:00', '14:00:00'),
('Dinner', '18:00:00', '20:00:00');

INSERT INTO menu (session_id, menu_date, food_items) VALUES
(1, '2026-05-12', 'Bread, Egg, Tea'),
(2, '2026-05-12', 'Rice, Shiro, Salad'),
(3, '2026-05-12', 'Injera, Doro Wat'),
(1, '2026-05-13', 'Porridge, Milk'),
(2, '2026-05-13', 'Pasta, Tomato Sauce'),
(3, '2026-05-13', 'Injera, Misir Wat');

INSERT INTO meal_transaction (student_id, session_id, transaction_date, scan_timestamp, status) VALUES
(1, 1, '2026-05-12', '2026-05-12 07:15:10', 'Success'),
(2, 1, '2026-05-12', '2026-05-12 07:30:45', 'Success'),
(3, 2, '2026-05-12', '2026-05-12 12:10:03', 'Success'),
(4, 2, '2026-05-12', '2026-05-12 13:05:27', 'Success'),
(5, 3, '2026-05-12', '2026-05-12 18:22:11', 'Success'),
(1, 2, '2026-05-13', '2026-05-13 12:14:55', 'Success');

SELECT
	transaction_date,
	COUNT(*) AS total_transactions
FROM meal_transaction
GROUP BY transaction_date
ORDER BY transaction_date;

SELECT
	mt.transaction_date,
	ms.session_name,
	COUNT(*) AS total
FROM meal_transaction mt
JOIN meal_session ms ON ms.session_id = mt.session_id
GROUP BY mt.transaction_date, ms.session_name
ORDER BY mt.transaction_date, ms.start_time;

SELECT
	s.student_id,
	s.full_name,
	COUNT(*) AS meals_taken
FROM meal_transaction mt
JOIN student s ON s.student_id = mt.student_id
GROUP BY s.student_id, s.full_name
ORDER BY meals_taken DESC, s.full_name
LIMIT 10;

SELECT
	m.menu_date,
	ms.session_name,
	m.food_items
FROM menu m
JOIN meal_session ms ON ms.session_id = m.session_id
ORDER BY m.menu_date, ms.start_time;

SELECT
	s.department,
	COUNT(*) AS total_meals
FROM meal_transaction mt
JOIN student s ON s.student_id = mt.student_id
GROUP BY s.department
ORDER BY total_meals DESC;

SELECT
	s.student_id,
	s.full_name,
	s.department
FROM student s
LEFT JOIN meal_transaction mt
	ON mt.student_id = s.student_id
	AND mt.transaction_date = '2026-05-12'
WHERE mt.transaction_id IS NULL
ORDER BY s.full_name;

SELECT
	mt.transaction_date,
	ms.session_name,
	MIN(mt.scan_timestamp) AS first_scan,
	MAX(mt.scan_timestamp) AS last_scan
FROM meal_transaction mt
JOIN meal_session ms ON ms.session_id = mt.session_id
GROUP BY mt.transaction_date, ms.session_name
ORDER BY mt.transaction_date, ms.start_time;

SELECT
	s.student_id,
	s.full_name,
	COUNT(DISTINCT mt.transaction_date) AS active_days
FROM student s
JOIN meal_transaction mt ON mt.student_id = s.student_id
GROUP BY s.student_id, s.full_name
ORDER BY active_days DESC, s.full_name;

SELECT
	m.menu_date,
	ms.session_name,
	COUNT(mt.transaction_id) AS transactions
FROM menu m
JOIN meal_session ms ON ms.session_id = m.session_id
LEFT JOIN meal_transaction mt
	ON mt.session_id = m.session_id
	AND mt.transaction_date = m.menu_date
GROUP BY m.menu_date, ms.session_name
ORDER BY m.menu_date, ms.start_time;

SELECT
	DATE(scan_timestamp) AS tx_day,
	HOUR(scan_timestamp) AS tx_hour,
	COUNT(*) AS scans
FROM meal_transaction
GROUP BY DATE(scan_timestamp), HOUR(scan_timestamp)
ORDER BY tx_day, scans DESC;
