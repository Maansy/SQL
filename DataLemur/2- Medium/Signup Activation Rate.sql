-- https://datalemur.com/questions/signup-confirmation-rate

SELECT  ROUND(1.0 * COUNT(t.signup_action) filter (WHERE signup_action = 'Confirmed') / 
COUNT(t.signup_action) ,2) AS confirm_rate
FROM emails AS e
LEFT JOIN texts AS t
ON e.email_id = t.email_id;