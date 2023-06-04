-- Game play analysis IV

--table (Activity) columns (player_id, event_date, => 'PK', device_id, games_played)

SELECT ROUND(COUNT(DISTINCT b.player_id) / COUNT(DISTINCT a.player_id),2) AS fraction
FROM (SELECT player_id, MIN(event_date) AS event_date
FROM Activity
GROUP BY player_id) AS a
LEFT JOIN Activity AS b
ON a.player_id = b.player_id AND a.event_date + 1 = b.event_date;
