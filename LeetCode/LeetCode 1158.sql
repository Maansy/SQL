--Market Analysis I

--Table 1: Users columns(user_id 'PK', join_date, favorite_brand)
--Table 2: Orders columns(order_id 'PK', order_date, item_id 'FK', buyer_id 'FK' , saller_id 'FK')
-- Table 3: Items columns(item_id 'PK', item_brand)

SELECT o.buyer_id AS buyer_id, u.join_date AS join_date,
SUM(
    CASE 
    WHEN YEAR(o.order_date) = 2019 
    THEN 1 
    ELSE 0 
    END) AS orders_in_2019
FROM Users AS u
LEFT JOIN Orders AS o
ON u.user_id = o.buyer_id
GROUP BY o.buyer_id, u.join_date;