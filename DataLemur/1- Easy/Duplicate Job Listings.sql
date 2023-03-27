-- https://datalemur.com/questions/duplicate-job-listings

WITH job_groubed AS (
SELECT company_id,  title, description , COUNT(job_id) as Job_count
FROM job_listings
GROUP BY
company_id,  title, description)
SELECT count(job_count) as co_w_duplicate_jobs FROM job_groubed
WHERE job_count > 1