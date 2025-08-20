--Q9. What is the monthly revenue trend?

SELECT
	TO_CHAR(DATE_TRUNC('Month', payment_date), 'YYYY-MM') AS month,
	SUM(amount) as total_revenue
FROM payment
GROUP BY month
ORDER BY month;
