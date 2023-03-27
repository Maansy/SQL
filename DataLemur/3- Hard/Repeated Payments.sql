-- https://datalemur.com/questions/repeated-payments

SELECT COUNT(diff)
FROM
(SELECT
  EXTRACT(epoch FROM transaction_timestamp -
  LAG(transaction_timestamp) OVER (
    PARTITION BY merchant_id, credit_card_id, amount 
    ORDER BY transaction_timestamp)
  ) / 60 AS diff
FROM transactions) AS temp_t
WHERE diff is not null
AND diff <= 10;