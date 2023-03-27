-- https://datalemur.com/questions/long-calls-growth

WITH temp_table AS(
SELECT * , lag(calls_count) OVER(ORDER BY mth) AS pre_mth
FROM(
SELECT EXTRACT(year FROM call_received) as year, EXTRACT(month FROM call_received) as mth,
COUNT(case_id) AS calls_count
FROM callers
WHERE call_duration_secs > 300
GROUP BY year,mth
ORDER BY year,mth) AS temp1)

SELECT year,mth ,ROUND( (100.0 * (calls_count - pre_mth) /  pre_mth),1) AS growth_pct
FROM temp_table; 