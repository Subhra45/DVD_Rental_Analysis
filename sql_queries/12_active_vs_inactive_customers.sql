--Q12. How many customers are active vs inactive?

SELECT
	(CASE WHEN active = 1 THEN 'active'
	ELSE 'inactive'
	END) AS customer_status,
	COUNT(customer_id) AS total_customers
FROM customer
GROUP BY customer_status;