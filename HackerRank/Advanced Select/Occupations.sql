set @d=0, @p=0, @s=0,@a=0;
select min(doctor), min(professor), min(singer), min(actor)
from (select case when occupation = 'Doctor' then name end as doctor,
		case when occupation = 'Professor' then name end as professor,
		case when occupation = 'Singer' then name end as Singer,
		case when occupation = 'Actor' then name end as Actor,
		case
		when occupation='Doctor' then (@d:=@d+1)
		when occupation='Professor' then (@p:=@p+1)
		when occupation='Singer' then (@s:=@s+1)
		when occupation='Actor' then (@a:=@a+1)
		end as rowNumber
	from occupations
	order by name) sub
group by rownumber