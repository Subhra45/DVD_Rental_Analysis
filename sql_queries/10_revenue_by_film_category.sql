--Q10. How much revenue does each film category generate?

SELECT
	c.category_id,
	c.name,
	SUM(p.amount) AS total_revenue
FROM category AS c
JOIN film_category AS fc ON fc.category_id =  c.category_id
JOIN inventory AS i ON i.film_id = fc.film_id
JOIN rental AS r ON r.inventory_id = i.inventory_id
JOIN payment AS p ON p.rental_id = r.rental_id
GROUP BY c.category_id, c.name
ORDER BY total_revenue DESC;