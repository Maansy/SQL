-- Game play analysis III

--table (Activity) columns (player_id, event_date, => 'PK', device_id, games_played)

--Solution 1
SELECT player_id, event_date,
SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date ASC) AS games_played_so_far
FROM Activity;