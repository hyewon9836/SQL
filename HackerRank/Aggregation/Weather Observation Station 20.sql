set @r=0;
select round(avg(lat_n),4)
from (select (@r:=@r+1) as r, lat_n from station order by lat_n) s
where 
    r=(select ceil(count(*)/2)from station) or
    r=(select floor(count(*)/2+1) from station)