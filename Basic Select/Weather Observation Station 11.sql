select distinct city 
from station 
where lower(left(city,1)) not in 
('a','e','i','o','u') or lower(right(city,1)) not in 
('a','e','i','o','u')