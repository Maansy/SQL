--Big countries

--table (World) columns (name 'PK', continent, area, population, gdp)
-- big if area at least 3M km^2 or population at least 25M

SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000