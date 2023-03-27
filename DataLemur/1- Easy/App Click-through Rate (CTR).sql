-- https://datalemur.com/questions/click-through-rate

SELECT app_id,
ROUND(100.0 * 
COUNT(CASE WHEN event_type = 'click' THEN 1 ELSE NULL END) /
COUNT(CASE WHEN event_type = 'impression' THEN 1 ELSE NULL END),2) as ctr_rate
FROM events
WHERE EXTRACT(year FROM timestamp) = 2022
GROUP BY app_id;
-- SELECT app_id, COUNT(*) FROM events 
-- WHERE event_type = 'impression'
-- GROUP BY app_id