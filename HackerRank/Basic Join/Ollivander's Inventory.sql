select w.id, p.age, w.coins_needed, w.power
from Wands w
 inner join Wands_Property p on p.code=w.code
where is_evil<1 
 and w.coins_needed =(select min(w2.coins_needed)
                        from Wands w2
                         inner join Wands_Property p2 on w2.code=p2.code
                        where p2.is_evil<1 
                         and w2.power=w.power 
                         and p2.age=p.age)
order by power desc, age desc
