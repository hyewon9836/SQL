select h.hacker_id, h.name, sum(sub.sc) total
from (select hacker_id, challenge_id ,max(score) sc
     from Submissions
     group by hacker_id, challenge_id) sub
join Hackers h on sub.hacker_id=h.hacker_id
group by h.hacker_id, h.name
having total>0
order by total desc, h.hacker_id