# 🎬 DVD Rental Analysis

## Project Overview

This project analyzes the DVD Rental sample database (PostgreSQL) to uncover insights about customer behavior, revenue trends, staff performance, and film popularity. The dataset is a popular sample provided for practicing SQL and BI tools.

Using SQL for querying and Power BI for visualization, we answer key business questions that a rental company might ask to improve operations and maximize revenue.

### Objectives

* Identify the top customers and their contribution to revenue
* Discover the most rented films and popular categories
* Track monthly revenue trends and seasonality
* Compare store performance and staff revenue contributions
* Analyze rental patterns (by hour and day of week)
* Evaluate customer activity (active vs inactive)
* Assess actor and film performance

### Tech Stack

* Database: PostgreSQL
* Query Language: SQL
* Visualization: Power BI
* Version Control: Git & GitHub

### Key Insights

* Certain film categories (like Action and Comedy) contribute the most to revenue
* The top 10 customers generate a significant share of total payments
* Rental activity peaks during specific evening hours
* The busiest rental days are typically weekends
* Monthly revenue trends show seasonality and business fluctuations
* Some actors appear in highly rented films, driving higher revenues
* The majority of customers are active, but a smaller group is inactive (potential churn risk)
* Store and staff performance varies, with some stores/staff generating higher revenue than others

### Repository Structure

```
dvd_rental_analysis/
│
├── README.md
├── sql_queries/
│   ├── 01_top_customers.sql
│   ├── 02_most_rented_films.sql
|   ├── 03_top_categories.sql
|   ├── 04_top_store.sql
|   ├── 05_top_staff.sql
|   ├── 06_hourly_rentals.sql
|   ├── 07_top_rental_day.sql
|   ├── 08_avg_rental_duration.sql
|   ├── 09_monthly_revenue_trend.sql
|   ├── 10_revenue_by_film_category.sql
│   ├── 11_top_actors.sql
|   ├── 12_active_vs_inactive_customers.sql
│   └── all_queries.sql
│
├── powerbi/
│   ├── dvd_rental_dashboard.pbix
│   └── screenshots/
│
├── docs/
│   └── dvd_rental_erd.png
│
└── LICENSE
```

### Dashboard Preview

### How to Run?
1. Database Setup
   - Install PostgreSQL
   - Load the sample DVD Rental database
   - Connect to the DB
2. Run Queries
   ```
   -- Example: Monthly Revenue
      SELECT 
          TO_CHAR(DATE_TRUNC('month', payment_date), 'YYYY-MM') AS month,
          SUM(amount) AS total_revenue
      FROM payment
      GROUP BY month
      ORDER BY month;
   ```
3. Power BI Dashboard
   - Open dvd_rental_dashboard.pbix
   - Connect to PostgreSQL
   - Refresh the visuals

### License

This project is licensed under the MIT License — feel free to use and adapt.

_Built with SQL, Power BI, and curiosity about movies & ❤️ for data!_
