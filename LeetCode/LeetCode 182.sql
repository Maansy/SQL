-- Duplicated emails

-- table (Person) columns (id 'PK' - email)

SELECT per1.email AS Email
FROM Person as per1
LEFT JOIN Person as per2
ON per1.email = per2.email
WHERE per1.email = per2.email;

-- grouping emails

SELECT email
FROM Person
GROUP BY email
HAVING COUNT(id) > 1;