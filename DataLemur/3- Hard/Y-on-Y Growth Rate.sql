-- https://datalemur.com/questions/yoy-growth-rate

WITH temp_table AS(
SELECT 	product_id, SUM(spend) AS total_spend,	EXTRACT(year from transaction_date) as year
FROM user_transactions
GROUP BY product_id, year
ORDER BY product_id,year)

SELECT year, product_id, total_spend AS curr_year_spend,
prev_year_spend, ROUND(100.0 * (total_spend - prev_year_spend) / prev_year_spend,2) AS yoy_rate
FROM(
SELECT product_id, total_spend, 
lag(total_spend) over(PARTITION BY product_id ORDER BY product_id,year) AS prev_year_spend, year
FROM temp_table) AS temp1;