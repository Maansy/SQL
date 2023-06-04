-- Game play analysis V

--table (Activity) columns (player_id, event_date, => 'PK', device_id, games_played)

SELECT a.event_data AS install_dt, COUNT(a.player_id) AS installs,
ROUND(COUNT(b.player_id) / COUNT(a.player_id),2) AS day1_retention
FROM(
SELECT player_id, MIN(event_date) AS event_date
FROM Activity
GROUP BY player_id
) AS a
LEFT JOIN Activity AS b
ON a.player_id = b.player_id AND a.event_date +1 = b.event_date 
GROUP BY a.event_data