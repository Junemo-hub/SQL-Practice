# Write your MySQL query statement below

SELECT name, bonus
FROM Employee
LEFT JOIN Bonus
ON Employee.empID = Bonus.empID 
WHERE bonus is null OR bonus < 1000