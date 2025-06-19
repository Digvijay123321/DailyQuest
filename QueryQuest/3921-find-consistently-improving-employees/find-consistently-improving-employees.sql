# Write your MySQL query statement below
with cte0 as (
    select employee_id
    from performance_reviews
    group by employee_id
    having count(employee_id) >= 3
), cte1 as (
    select employee_id, review_date, rating,
        lead(rating) over(partition by employee_id order by review_date desc) as next_rating,
        lead(rating, 2) over(partition by employee_id order by review_date desc) as next_next_rating,
        row_number() over(partition by employee_id order by review_date desc) as row_num
    from performance_reviews
    where employee_id in (select * from cte0)
), cte2 as (
    select *
    from cte1
    where row_num = 1 and
        rating > next_rating and
        next_next_rating < next_rating
)

select
    c.employee_id, e.name, (c.rating - c.next_next_rating) as improvement_score
from cte2 as c
left join employees as e on c.employee_id = e.employee_id
order by 3 desc, 2