select hour(datetime) hour, count(animal_id)
from animal_outs
group by hour
having 9<=hour and hour<=19
order by hour