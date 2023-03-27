-- https://datalemur.com/questions/card-launch-success

WITH temp_table AS(
SELECT card_name, issued_amount, 
make_date(issue_year,issue_month,1) AS issue_date,
MIN(make_date(issue_year,issue_month,1)) OVER(PARTITION BY card_name) AS launch_date
FROM monthly_cards_issued
ORDER BY issue_date)


SELECT card_name, issued_amount  FROM temp_table
WHERE issue_date = launch_date
ORDER BY issued_amount DESC;