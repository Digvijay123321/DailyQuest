# Write your MySQL query statement below
select
    t.request_at as Day, 
    round(sum(if(t.status != "completed", 1, 0)) / count(t.status), 2) as "Cancellation Rate"
from trips as t
where
    client_id in (select users_id from users where role = "client" and banned = "No") and
    driver_id in (select users_id from users where role = "driver" and banned = "No") and
    t.request_at >= "2013-10-01" and t.request_at <= "2013-10-03"
group by t.request_at
order by Day