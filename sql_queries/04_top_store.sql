--Q4. Which store generates the most revenue?

SELECT
	s.store_id,
	SUM(p.amount) AS revenue
FROM store AS s
JOIN CUSTOMER AS c on c.store_id = s.store_id
JOIN PAYMENT AS p on p.customer_id = c.customer_id
GROUP BY s.store_id
ORDER BY revenue DESC
LIMIT 1;