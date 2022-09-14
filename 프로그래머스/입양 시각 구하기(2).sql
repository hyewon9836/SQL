set @hour:=-1;
select (@hour:=@hour+1) hour,
	(select count(ao2.animal_id)
	 from animal_outs ao2
	 where hour(ao2.datetime)=@hour) cnt
from animal_outs
where @hour<23
order by @hour