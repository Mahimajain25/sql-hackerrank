SELECT MAX(salary*months) as earnings,COUNT(*)
FROM Employee
GROUP BY Salary
ORDER BY earnings DESC 
LIMIT 1
