SELECT b.title, b.board_id, r.reply_id, r.writer_id, r.contents, date_format(r.created_date,'%Y-%m-%d') created_date
from used_goods_board b, used_goods_reply r
where b.board_id = r.board_id
    and year(b.created_date)=2022
    and month(b.created_date)=10
order by r.created_date, b.title