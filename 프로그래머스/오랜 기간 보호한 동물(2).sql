select ai.animal_id, ai.name
from animal_ins ai, animal_outs ao
where ai.animal_id=ao.animal_id
order by datediff(ai.datetime,ao.datetime)
limit 2