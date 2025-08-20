--Q11. Which actors appear in the most rented films?

SELECT 
	a.actor_id,
	CONCAT(a.first_name, ' ', a.last_name) AS actor,
	SUM(p.amount) AS revenue_generated
FROM actor AS a
JOIN film_actor AS fa ON fa.actor_id = a.actor_id
JOIN inventory AS i ON i.film_id = fa.film_id
JOIN rental AS r ON r.inventory_id = i.inventory_id
JOIN payment AS p ON p.rental_id = r.rental_id
GROUP BY a.actor_id, actor
ORDER BY revenue_generated;