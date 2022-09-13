select Start_Date, min(End_Date)
from(select Start_Date
    from Projects
    where Start_Date not in (select End_Date from Projects)) sub1,
    (select End_Date
    from Projects
    where End_Date not in (select Start_Date from Projects)) sub2
where Start_Date<End_Date
group by Start_Date
order by datediff(min(end_date),start_date),start_date