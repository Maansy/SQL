https://datalemur.com/questions/sql-page-with-no-likes

-- SELECT pages.page_id FROM pages
-- LEFT JOIN page_likes as pl
-- ON pages.page_id = pl.page_id
-- WHERE pl.page_id is NULL;

SELECT page_id
FROM pages
EXCEPT
SELECT page_id
FROM page_likes
ORDER BY page_id;

-- with pages_with_no_likes as (
-- SELECT pages.page_id FROM pages
-- LEFT JOIN page_likes as pl
-- ON pages.page_id = pl.page_id
-- WHERE pl.page_id is NULL;)