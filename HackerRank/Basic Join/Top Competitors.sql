select h.hacker_id, h.name
from Hackers h
    inner join Submissions s on S.hacker_id = h.hacker_id
    inner join Challenges c on c.challenge_id = s.challenge_id
    inner join Difficulty d on d.difficulty_level = c.difficulty_level
where d.score = s.score and c.difficulty_level = d.difficulty_level
group by h.hacker_id, h.name
having count(h.hacker_id)>1
order by count(h.hacker_id) desc, h.hacker_id
