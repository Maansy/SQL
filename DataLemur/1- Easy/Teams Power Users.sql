-- https://datalemur.com/questions/teams-power-users

SELECT sender_id, count(message_id) as message_count FROM messages
WHERE EXTRACT(month from sent_date) = 8
AND EXTRACT(year from sent_date) = 2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;