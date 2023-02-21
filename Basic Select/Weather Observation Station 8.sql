SELECT DISTINCT city 
FROM station
WHERE LOWER(LEFT(city,1)) in ('a','e','i','o','u') and LOWER(RIGHT(city,1)) in ('a','e','i','o','u')