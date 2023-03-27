-- https://datalemur.com/questions/uncategorized-calls-percentage

SELECT ROUND(100 * COUNT(case_id) filter (
WHERE call_category is NULL or call_category = 'n/a')
/ COUNT(case_id), 1) as call_percentage
FROM callers