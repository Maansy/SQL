--Classes More than 5 students

--table (Courses) columns (student, class) => 'PK'


SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5