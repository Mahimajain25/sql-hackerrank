SELECT t1.Start_Date, t2.End_date
from (
    SELECT Start_date, row_number() over( order by Start_Date ASC) as rn 
    FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) as t1
JOIN 
(
   SELECT End_date, row_number() over(order by Start_Date ASC) as rn 
   FROM Projects WHERE End_Date NOT IN (Select Start_Date from Projects)) as t2 
ON t1.rn = t2.rn 
ORDER BY DATEDIFF(t2.End_Date, t1.Start_Date) ASC,t1.Start_Date ASC 