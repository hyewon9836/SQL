select h.hacker_id, h.name, count(c.challenge_id) cnt
from Hackers h
    join Challenges c on h.hacker_id=c.hacker_id
group by h.hacker_id, h.name
having cnt=(select max(sub.cnt) as maxcnt
           from (select hacker_id, count(*) cnt from challenges group by hacker_id) sub)
    or cnt in (select sub.cnt
              from (select hacker_id, count(*) cnt from challenges group by hacker_id)sub
            group by sub.cnt
            having count(*)=1)
order by cnt desc, hacker_id