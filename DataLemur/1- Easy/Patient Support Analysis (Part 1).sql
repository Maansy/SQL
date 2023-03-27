-- https://datalemur.com/questions/frequent-callers

WITH temp_table AS( SELECT policy_holder_id , COUNT(policy_holder_id) FROM callers
GROUP BY policy_holder_id
HAVING COUNT(policy_holder_id) >= 3
ORDER BY COUNT(policy_holder_id))

SELECT COUNT(*) FROM temp_table;