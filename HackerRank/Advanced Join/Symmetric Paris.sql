select sub.x, sub.y
from (select if(x<=y,x,y) x, if(x<=y,y,x) y
	from functions) sub
group by sub.x, sub.y
having count(*)>=2
order by sub.x