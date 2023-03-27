-- https://datalemur.com/questions/updated-status

WITH payment_status AS (
SELECT
  advertiser.user_id,
  advertiser.status,
  payment.paid
FROM advertiser
LEFT JOIN daily_pay AS payment
  ON advertiser.user_id = payment.user_id

UNION

SELECT
  payment.user_id,
  advertiser.status,
  payment.paid
FROM daily_pay AS payment
LEFT JOIN advertiser
  ON advertiser.user_id = payment.user_id
)

SELECT user_id,
CASE 
  WHEN paid is null THEN 'CHURN'
  WHEN status !='CHURN' AND paid is not null THEN 'EXISTING'
  WHEN status ='CHURN' AND paid is not null THEN 'RESURRECT'
  WHEN status is null THEN 'NEW'
END AS new_status 
FROM payment_status
ORDER BY user_id ;