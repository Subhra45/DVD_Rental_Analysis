--Q7. On which day of the week do most rentals happen?

SELECT
    EXTRACT(DOW FROM rental_date) AS day_num,
    TO_CHAR(rental_date, 'Day') AS day_of_week,
    COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY day_num, day_of_week
ORDER BY total_rentals DESC;
