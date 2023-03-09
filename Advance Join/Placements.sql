SELECT Name
FROM Students s
JOIN Packages p on s.id = p.id 
JOIN Friends f on f.id = p.id
JOIN Packages p1 on f.friend_id = p1.id 
WHERE p1.salary > p.salary
ORDER BY p1.salary
