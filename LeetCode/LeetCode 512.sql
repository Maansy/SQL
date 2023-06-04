-- Game play analysis II

--table (Activity) columns (player_id, event_date, => 'PK', device_id, games_played)

--Solution 1
SELECT a.player_id , b.device_id
FROM
    (SELECT player_id, MIN(event_date) as event_date
    FROM Activity
    GROUP BY player_id) as a
    JOIN Activity AS b
    ON a.player_id = p.player_id AND a.event_date = b.event_date;

--Solution 2
SELECT player_id, device_id
FROM(
SELECT player_id, device_id, event_date,
ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date ASC) AS sort_col
FROM Activity) AS lookup
WHERE sort_col = 1