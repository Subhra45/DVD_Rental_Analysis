----Customer and Revenue----
--Q1. Who are the top 10 customers by total spending?

SELECT
	c.customer_id,
	CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
	SUM(p.amount) AS total_amount
FROM customer AS c
JOIN payment AS p ON p.customer_id = c.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_amount DESC
LIMIT 10;

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

--Q5. Which staff member handled the most revenue?

SELECT 
	s.staff_id,
	CONCAT(s.first_name, ' ', s.last_name) AS name,
	SUM(p.amount) AS total_revenue
FROM staff AS s
JOIN payment AS p on s.staff_id = p.staff_id
GROUP BY s.staff_id, name
ORDER BY total_revenue DESC;

----RENTAL BEHAVIOUR ANALYSIS----
--Q6. At what hour of the day do most rentals happen?

SELECT
	EXTRACT(hour FROM rental_date) AS hour,
	COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY hour
ORDER BY total_rentals DESC;

--Q7. On which day of the week do most rentals happen?

SELECT
    EXTRACT(DOW FROM rental_date) AS day_num,
    TO_CHAR(rental_date, 'Day') AS day_of_week,
    COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY day_num, day_of_week
ORDER BY total_rentals DESC;

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

--Q9. What is the monthly revenue trend?

SELECT
	TO_CHAR(DATE_TRUNC('Month', payment_date), 'YYYY-MM') AS month,
	SUM(amount) as total_revenue
FROM payment
GROUP BY month
ORDER BY month;

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

--Q12. How many customers are active vs inactive?

	SELECT
		(CASE WHEN active = 1 THEN 'active'
		ELSE 'inactive'
		END) AS customer_status,
		COUNT(customer_id) AS total_customers
	FROM customer
	GROUP BY customer_status;












