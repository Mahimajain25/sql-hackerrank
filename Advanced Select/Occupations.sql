SELECT 
MIN(IF(Occupation='Doctor',Name,null)) as Doctor,
MIN(IF(Occupation='Professor',Name,null)) as Professor,
MIN(IF(Occupation='Singer',Name,null)) as Singer,
MIN(IF(Occupation='Actor',Name,null)) as Actor
FROM
(
    SELECT Name,Occupation,ROW_NUMBER()
    OVER(PARTITION BY Occupation 
         ORDER BY Name ) as row_num
    FROM OCCUPATIONS
) as part_table
GROUP BY row_num
