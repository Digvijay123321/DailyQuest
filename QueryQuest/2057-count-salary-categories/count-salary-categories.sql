# Write your MySQL query statement below
select c.category,
  ifnull(a.accounts_count, 0) as accounts_count
from (
  select 'Low Salary' as category
  union all
  select 'Average Salary'
  union all
  select 'High Salary'
) as c
left join (
  select 
    case 
      when income < 20000 then 'Low Salary'
      when income <= 50000 then 'Average Salary'
      else 'High Salary'
    end as category,
    count(*) as accounts_count
  from accounts
  group by category
) as a on c.category = a.category