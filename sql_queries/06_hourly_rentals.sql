--Q6. At what hour of the day do most rentals happen?

SELECT
	EXTRACT(hour FROM rental_date) AS hour,
	COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY hour
ORDER BY total_rentals DESC;