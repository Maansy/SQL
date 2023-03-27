-- https://datalemur.com/questions/alibaba-compressed-mean

SELECT ROUND( SUM(order_occurrences * item_count::decimal) / SUM(order_occurrences),1)  as mean
FROM items_per_order;