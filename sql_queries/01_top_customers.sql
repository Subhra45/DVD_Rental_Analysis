--Q1. Who are the top 10 customers by total spending?

SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
	SUM(p.amount) AS total_amount
FROM customer AS c
JOIN payment AS p ON p.customer_id = c.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_amount DESC
LIMIT 10;