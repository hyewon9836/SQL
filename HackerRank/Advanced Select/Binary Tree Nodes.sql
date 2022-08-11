select n, (case when p is null then 'Root'
                when n not in (select distinct p from BST where p is not null) then 'Leaf'
                else 'Inner'
          end) node
from BST
order by n