--Triangle judgement

--table (Triangle) columns (x, y, z) => 'PK'

SELECT *,
CASE 
    WHEN x+y > z AND y+z > x AND x+z > y
    THEN 'Yes'
    ELSE 'NO'
    END AS triangle
FROM Triangle