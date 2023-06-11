-- Supsicious bank accounts

--table1 Accounts columns account_id 'PK', max_income
--table2 Transactions columns transaction_id 'PK', account_id, type,amount, day
--type column in ENUM 'creditor' ==> 'deposite' , 'debtor' ==> 'withdrew'

WITH cte AS(
SELECT account_id, date_format(day,'%Y%m') AS yr_mth, sum(amount) AS total_amount FROM
Transactions
WHERE type = 'creditor'
GROUP BY account_id, date_format(day,'%Y%m'),type),

cte2 AS(
SELECT cte.*, a.max_income, 
LEAD(c.yr_mth) OVER(PARTITION BY cte.account_id ORDER BY c.yr_mth) AS next_mth
FROM cte 
LEFT JOIN Accounts AS a
ON a.account_id = cte.account_id
WHERE a.max_income < cte.total_amount)


SELECT DISTINCT account_id
FROM cte2
WHERE next_mth - yr_mth = 1