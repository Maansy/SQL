-- https://datalemur.com/questions/patient-call-history

WITH calls AS (
SELECT 
  policy_holder_id,
  call_received AS current_call,
  LEAD(call_received) OVER (
    PARTITION BY policy_holder_id ORDER BY call_received) AS next_call
FROM callers
)

SELECT COUNT(DISTINCT policy_holder_id) AS patient_count
FROM calls
WHERE current_call + INTERVAL '168 hours' >= next_call;