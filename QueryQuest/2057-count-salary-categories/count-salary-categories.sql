# Write your MySQL query statement below
with low_salary as (
    select count(*) as count
    from accounts
    where income < 20000
), average_salary as (
    select count(*) as count
    from accounts
    where income between 20000 and 50000
), high_salary as (
    select count(*) as count
    from accounts
    where income > 50000
)

select "High Salary" as category, count as accounts_count
from high_salary
union all
select "Low Salary" as category, count
from low_salary
union all
select "Average Salary" as category, count
from average_salary
