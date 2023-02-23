SELECT ROUND(LAT_N,4)
FROM STATION AS st
WHERE (SELECT Count(lat_n) FROM station WHERE lat_n < st.lat_n) = (SELECT Count(lat_n) FROM station WHERE lat_n > st.lat_n)  
OR
SELECT round(lat_n,4) FROM 
(select lat_n,row_number() over(order by lat_n ASC) as rn from station) as tb1
where rn=250
