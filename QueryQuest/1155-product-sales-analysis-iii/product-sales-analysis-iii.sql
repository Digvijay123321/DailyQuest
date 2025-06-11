# Write your MySQL query statement below
# Write your MySQL query statement below
with cte as (
    select *,
    rank() over(partition by product_id order by year) as release_rank
    from sales
)
select product_id, year as first_year, quantity, price
from cte
where release_rank = 1