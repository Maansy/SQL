-- https://datalemur.com/questions/time-spent-snaps

SELECT b.age_bucket ,
ROUND(100.0 * SUM(a.time_spent) filter (WHERE activity_type = 'send')  / 
SUM(a.time_spent),2) AS send_perc,
ROUND(100.0 * SUM(a.time_spent) filter (WHERE activity_type = 'open') / 
SUM(a.time_spent) , 2) AS open_perc
FROM activities AS a
LEFT JOIN age_breakdown as b
ON a.user_id = b.user_id
WHERE a.activity_type IN ('open' , 'send')
GROUP BY b.age_bucket
ORDER BY b.age_bucket