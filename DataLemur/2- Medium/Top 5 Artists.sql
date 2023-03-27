-- https://datalemur.com/questions/top-fans-rank

WITH temp_table AS (
select a.artist_name , COUNT(a.artist_name) as apper_count
from global_song_rank as g
left join songs as s
on g.song_id = s.song_id
left join artists as a
on s.artist_id = a.artist_id
WHERE g.rank <= 10
GROUP BY a.artist_name),

temp_table2 AS (
SELECT artist_name, DENSE_RANK() OVER(ORDER BY apper_count DESC) as artist_rank
FROM temp_table)

SELECT * FROM temp_table2 WHERE artist_rank <= 5;