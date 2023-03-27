-- https://datalemur.com/questions/international-call-percentage

WITH temp_table AS (
SELECT c.caller_id , i.country_id AS caller_country,
c.receiver_id,ii.country_id AS recevier_country
FROM phone_calls AS c
LEFT JOIN phone_info AS i
ON c.caller_id = i.caller_id
LEFT JOIN phone_info AS ii
ON c.receiver_id = ii.caller_id)

SELECT ROUND( 100.0 * COUNT(*) filter (WHERE caller_country != recevier_country) / 
COUNT(*),1) AS international_calls_pct
FROM temp_table;