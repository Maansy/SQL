-- https://datalemur.com/questions/sql-third-transaction

WITH temp_table AS
(SELECT user_id, spend,transaction_date,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY user_id, transaction_date) as row_no
FROM transactions)

SELECT user_id, spend,transaction_date FROM temp_table
WHERE row_no = 3;