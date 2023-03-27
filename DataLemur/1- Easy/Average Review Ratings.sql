-- https://datalemur.com/questions/sql-avg-review-ratings

SELECT EXTRACT(month FROM submit_date) as mth, product_id as product,ROUND(AVG(stars), 2) as avg_stars 
FROM reviews
GROUP BY product_id, mth
ORDER BY mth,product_id;