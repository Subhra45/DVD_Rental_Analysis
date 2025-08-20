--Q5. Which staff member handled the most revenue?

SELECT 
	s.staff_id,
	CONCAT(s.first_name, ' ', s.last_name) AS name,
	SUM(p.amount) AS total_revenue
FROM staff AS s
JOIN payment AS p on s.staff_id = p.staff_id
GROUP BY s.staff_id, name
ORDER BY total_revenue DESC;