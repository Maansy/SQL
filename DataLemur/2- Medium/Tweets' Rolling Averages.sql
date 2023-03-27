-- https://datalemur.com/questions/rolling-average-tweets

WITH tweet_count AS (
SELECT user_id, tweet_date,COUNT(DISTINCT tweet_id) AS tweet_num
FROM tweets
GROUP BY user_id, tweet_date
)
SELECT user_id, tweet_date ,
ROUND(
AVG(tweet_num) 
OVER(PARTITION BY user_id ORDER BY user_id , tweet_date 
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) as avg_row
FROM tweet_count