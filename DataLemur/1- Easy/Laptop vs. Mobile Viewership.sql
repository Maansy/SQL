
-- https://datalemur.com/questions/laptop-mobile-viewership
-- WITH L(laptop_views) as (SELECT count(*) 
-- FROM viewership
-- WHERE device_type = 'laptop'),
-- M(mobile_views) as (SELECT count(*) 
-- FROM viewership
-- WHERE device_type in ('tablet' , 'phone'))
-- SELECT L.laptop_views, M.mobile_views FROM L,M;

SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE NULL END) AS laptop_views,
  SUM(CASE WHEN device_type IN ('phone','tablet') THEN 1 ELSE NULL END) AS mobile_views
FROM viewership;