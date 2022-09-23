select contests.contest_id, contests.hacker_id, contests.name, sum(ts), sum(tas), sum(tv), sum(tnv)
from contests
    join colleges on contests.contest_id=colleges.contest_id
    join challenges on colleges.college_id=challenges.college_id
    left join (select challenge_id, sum(total_views) tv, sum(total_unique_views) tnv
               from view_stats
               group by challenge_id) vs
               on vs.challenge_id=challenges.challenge_id
    left join (select challenge_id, sum(total_submissions) ts, sum(total_accepted_submissions) tas
               from submission_stats
              group by challenge_id) ss
              on ss.challenge_id=challenges.challenge_id
group by contests.contest_id, contests.hacker_id, contests.name
having sum(ts)>0 and sum(tas)>0 and sum(tv)>0 and sum(tnv)>0
order by contests.contest_id
    