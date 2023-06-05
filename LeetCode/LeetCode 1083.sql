-- Sales analysis II

--table1 (Product) columns (product_id 'PK', product_name,unit_price)
--table2 (Sales) columns (seller_id, product_id, buyer_id, sale_date, quantity, price)

SELECT saller_id 
FROM(
SELECT saller_id, 
SUM(CASE WHEN product_id = 1 THEN 1 ELSE 0 END) AS S8,
SUM(CASE WHEN product_id = 3 THEN 1 ELSE 0 END) AS iPhone
FROM Sales
GROUP BY saller_id
) AS a
WHERE a.S8 > 0 AND a.iPhone = 0