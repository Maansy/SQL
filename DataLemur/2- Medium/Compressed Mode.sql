-- https://datalemur.com/questions/alibaba-compressed-mode

SELECT item_count
FROM items_per_order
WHERE order_occurrences = 
  (SELECT MODE() WITHIN GROUP (ORDER BY order_occurrences DESC) 
  FROM items_per_order)
ORDER BY item_count;