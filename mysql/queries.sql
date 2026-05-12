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
