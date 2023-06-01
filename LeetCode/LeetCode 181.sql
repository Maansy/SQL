-- Employees earning than their manager.

-- table (Employee) columns (id PK'' - name - salary - managerid)

SELECT emp1.name AS Employee
FROM Employee AS emp1
LEFT JOIN Employee AS emp2
ON emp1.manager_id = emp2.id 
WHERE emp1.salary > emp2.salary;