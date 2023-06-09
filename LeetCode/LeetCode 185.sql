-- Department top three salaries

--table1: Employee columns (Id "PK", Name, Salary, DepartmentId)
--table2: Department columns (Id "PK", Name)

SELECT t.Department AS Department, t.Name AS Employee, t.Salary AS Salary 
FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) AS 'Rank'
FROM Employee AS e
LEFT JOIN Department AS d
on e.DepartmentId = d.Id
) AS t
WHERE Rank <= 3