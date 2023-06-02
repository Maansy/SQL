--Customer Placing the largest number of orders

--tabel (Orders) columns (order_number 'PK', customer_number)

WITH cte AS
(SELECT customer_number, COUNT(order_number) AS numOrd
FROM Orders
GROUP BY customer_number)

SELECT customer_number
FROM cte
WHERE numOrd = (SELECT MAX(numOrd) FROM cte);