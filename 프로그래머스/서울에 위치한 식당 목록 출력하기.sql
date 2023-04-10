select ri.rest_id, ri.rest_name, ri.food_type, ri.favorites, ri.address, round(rs.avg_score,2)
from rest_info ri, 
    (select rest_id, avg(review_score) avg_score
    from rest_review
    group by rest_id) rs
where ri.rest_id = rs.rest_id
    and left(ri.address,2)='서울'
order by rs.avg_score desc, ri.favorites desc