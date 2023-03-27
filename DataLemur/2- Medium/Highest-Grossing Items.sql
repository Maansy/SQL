-- https://datalemur.com/questions/sql-highest-grossing

SELECT 
  category, 
  product, 
  total_spend 
FROM (
    SELECT 
      *, 
      RANK() OVER (
        PARTITION BY category 
        ORDER BY total_spend DESC) AS ranking 
    FROM (
        SELECT 
          category, 
          product, 
          SUM(spend) AS total_spend 
        FROM product_spend 
        WHERE transaction_date >= '2022-01-01' 
          AND transaction_date <= '2022-12-31' 
        GROUP BY category, product) AS total_spend
  ) AS top_spend 
WHERE ranking <= 2 
ORDER BY category, ranking;