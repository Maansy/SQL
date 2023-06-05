-- Sales analysis I

--table1 (Product) columns (product_id 'PK', product_name,unit_price)
--table2 (Sales) columns (seller_id, product_id, buyer_id, sale_date, quantity, price)

SELECT saller_id
FROM Sales
GROUP BY saller_id
HAVING SUM(price) = (
SELECT TOP 1 SUM(price) AS total_sales_amount
FROM Sales
WHERE rownum = 1
GROUP BY saller_id
ORDER BY total_sales_amount DESC)