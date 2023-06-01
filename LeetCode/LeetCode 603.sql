-- Consecutive available seats

--table (Cinema) columns (seat_id 'PK', free 'bool' 1 = Free)

SELECT seat_id
FROM
(SELECT *, LEAD(free) OVER(ORDER BY seat_id) AS next_seat,
LAG(free) OVER(ORDER BY seat_id) AS previous_seat 
FROM Cinema) AS subquery
WHERE (subquery.free = 1 AND subquery.next_seat =1) OR (subquery.free = 1 AND subquery.previous_seat =1)
ORDER BY seat_id