--Game play analysis I

--table (Activity) columns (player_id, event_date, => 'PK', device_id, games_played)

SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;