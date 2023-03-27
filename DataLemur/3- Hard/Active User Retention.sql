-- https://datalemur.com/questions/user-retention

-- WITH temp_table AS(
-- SELECT user_id, EXTRACT(month from event_date) AS event_month, 
-- MAX(EXTRACT(month FROM event_date)) 
--   OVER(ORDER BY user_id) AS max_month
-- FROM user_actions),

-- -- SELECT EXTRACT(month FROM MAX(event_date)) AS  month  ,
-- -- COUNT(user_id) AS monthly_active_user
-- -- FROM temp_table
-- -- WHERE EXTRACT(month FROM event_date) = max_month
-- -- OR  EXTRACT(month FROM event_date) = (max_month - 1);
-- temp_table2 AS(
-- SELECT * , RANK() OVER(PARTITION BY user_id ORDER BY event_month)  AS rank
-- FROM temp_table
-- WHERE event_month = max_month OR event_month = (max_month - 1))

-- SELECT MAX(max_month) AS month, 
-- COUNT(DISTINCT user_id) AS monthly_active_user FROM temp_table2
-- WHERE rank > 1

SELECT 
  EXTRACT(MONTH FROM curr_month.event_date) AS mth, 
  COUNT(DISTINCT curr_month.user_id) AS monthly_active_users 
FROM user_actions AS curr_month
WHERE EXISTS (
  SELECT last_month.user_id 
  FROM user_actions AS last_month
  WHERE last_month.user_id = curr_month.user_id
    AND EXTRACT(MONTH FROM last_month.event_date) =
    EXTRACT(MONTH FROM curr_month.event_date - interval '1 month')
)
  AND EXTRACT(MONTH FROM curr_month.event_date) = 7
  AND EXTRACT(YEAR FROM curr_month.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM curr_month.event_date);