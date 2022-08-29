select if (g.grade>=8, s.name, 'NULL'), g.grade, s.marks
from students s join grades g
on s.marks between g.min_mark and g.max_mark
order by g.grade desc, s.name, s.marks