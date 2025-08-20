--Q3. Which film categories are the most popular by rental count?

SELECT
	c.category_id,
	c.name,
	COUNT(r.rental_id) as total_rental_count
FROM category AS c
JOIN film_category AS f ON f.category_id = c.category_id
JOIN inventory AS i ON i.film_id = f.film_id
JOIN rental AS r ON r.inventory_id = i.inventory_id
GROUP BY c.category_id, c.name
ORDER BY total_rental_count DESC
LIMIT 10;