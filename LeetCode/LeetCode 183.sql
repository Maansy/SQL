-- customers who never order

-- table 1 (Cusotmers) columns (id "PK", name)
-- table 2 (Orders) columns (id "PK", customerId "FK" )

-- Solution 1
SELECT name AS Customers
FROM Customers AS cust
LEFT JOIN Orders
ON cust.id = orders.customerId
WHERE orders.id IS NULL;

-- Solution 2
-- We can't put cust.name in wehre clause because if I have duplicated names but their id in unique,
-- the where clause will ignore it and it will get wrong inforamtion.
SELECT cust.name AS Customers
FROM Customers as cust
WHERE cust.id NOT IN
(SELECT cust.id
FROM Customers AS cust
INNER JOIN Orders
ON cust.id = orders.customerId);

