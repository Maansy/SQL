-- https://datalemur.com/questions/completed-trades

WITH temp_table AS(
SELECT t.order_id , t.user_id,  t.price, t.quantity, t.status, u.city
FROM trades as t
LEFT JOIN users as u
ON t.user_id = u.user_id
)

SELECT tt.city, COUNT(tt.order_id) AS total_orders 
FROM temp_table as tt
WHERE tt.status = 'Completed'
GROUP BY tt.city
ORDER BY total_orders DESC
LIMIT 3;