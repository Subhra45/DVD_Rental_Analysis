--Q8. What is the average rental duration (in days) by film category?

SELECT
	c.category_id,
	c.name,
	AVG(f.rental_duration) AS avg_rental_duration
FROM category AS c
JOIN film_category AS fc ON fc.category_id = c.category_id
JOIN film AS f ON f.film_id = fc.film_id
GROUP BY c.category_id, c.name
ORDER BY avg_rental_duration;