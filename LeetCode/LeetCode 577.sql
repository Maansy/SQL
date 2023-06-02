-- Employee bonus

--tabel 1 (Employee) columns (empId 'PK', name, sumpervisor, salary)
--tabel 2 (Bonus) columns (empid 'PK,FK', bonus )


SELECT emp.name AS name , bonus.bonus AS bonus
FROM Employee AS emp
LEFT JOIN Bonus
ON emp.empId = bonus.empId 
WHERE bonus.bonus IS NULL OR bonus.bonus < 1000;