--Apples and oranges

--table sales columns (sale_data, fruit) => PK, sold_num

WITH cte AS
(SELECT *
FROM sales
ORDER BY sale_data, fruit),

cte2 AS(
SELECT *, LEAD(sold_num,1) OVER(PARTITION BY sales_date) AS orange_num
FROM cte)

SELECT sales_date, (sold_num - orange_num) FROM cte2
WHERE orange_num IS NOT NULL;