# Write your MySQL query statement below
with cte as (
    select *,
        case 
        when people >= 100 then 'true' else 'false' 
        end as crowded
    from Stadium
),
marked as (
    select *,
        ROW_NUMBER() over (order by visit_date) 
        - ROW_NUMBER() over (partition by crowded order by visit_date) as grp
    from cte
),
grouped as (
    select crowded, grp
    from marked
    group by crowded, grp
    having crowded = 'true' and count(*) >= 3
)
select m.id, m.visit_date, m.people
from marked m
join grouped g on m.crowded = g.crowded and m.grp = g.grp
order by m.visit_date;
