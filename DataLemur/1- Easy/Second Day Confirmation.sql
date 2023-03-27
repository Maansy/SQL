-- https://datalemur.com/questions/second-day-confirmation

-- SELECT e.user_id , (DATE::texts.action_date) , (DATE::e.signup_date) FROM emails as e
-- LEFT JOIN texts as t
-- ON e.email_id = t.email_id
-- WHERE (DATE::texts.action_date) > (DATE::e.signup_date);

SELECT emails.user_id
FROM emails
INNER JOIN texts
  ON emails.email_id = texts.email_id
WHERE texts.signup_action = 'Confirmed' 
AND texts.action_date = emails.signup_date + INTERVAL '1 day';