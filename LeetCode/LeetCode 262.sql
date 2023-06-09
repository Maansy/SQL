--Trips and Users

--table1: Trips columns (Id 'PK', Client_Id'FK', Driver_Id'FK', City_Id, Status, Request_at)
--table2: Users columns (Users_Id 'PK', Banned, Role)

SELECT t.Request_at AS Day,
ROUND(SUM(CASE WHEN t.Status = 'completed' THEN 0 ELSE 1 END)/COUNT(*),2) AS 'Cancellation Rate'
FROM Trips AS t
LEFT JOIN Users AS u
ON t.Client_Id = u.Users_Id
WHERE u.Banned = 'No' AND t.Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.Request_at
ORDER BY t.Request_at ASC;
