-- https://datalemur.com/questions/histogram-users-purchases

WITH temp_table AS(
SELECT transaction_date , user_id, COUNT(product_id) AS purchase_count,
rank() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS rank
FROM user_transactions
GROUP BY transaction_date , user_id)

SELECT transaction_date	,user_id	, SUM(purchase_count) FROM temp_table
WHERE rank = 1
GROUP BY transaction_date	,user_id
ORDER BY transaction_date;