--Q2. Which films are rented the most?

SELECT
	f.film_id,
	f.title,
	COUNT(r.rental_id) AS total_rentals
FROM film AS f
JOIN inventory AS i ON i.film_id = f.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY total_rentals DESC;