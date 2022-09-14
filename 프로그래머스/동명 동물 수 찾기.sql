select name, count(name) cnt
from animal_ins
group by name
having cnt>=2
order by name