-- find customer referee

--tabel (Customer) columns (id 'PK',name, referee_id)

SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL ;