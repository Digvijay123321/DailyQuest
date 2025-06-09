# Write your MySQL query statement below
select
case
    when id % 2 = 1 and id + 1 in (select id from seat) then id + 1. #checks if seat is odd and can be swapped with next even seat if that seat exists in table
    when id % 2 = 0 then id - 1 # swaps even seat with previous seat
    else id # when you have odd seats then first and second conditions fail at end of table and we just return same id
end as id, student
from seat
order by id;
