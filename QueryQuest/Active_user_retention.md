# Active User Retention: Facebook

**Question link:** [Active User Retention: Facebook](Active User Retention)

credits: Datalemur

## Solution:
```sql
WITH CTE as (
SELECT
  *,
  EXTRACT(month from event_date) as month_active,
  EXTRACT(year from event_date) as year_active,
  row_number() OVER(PARTITION BY user_id order by user_id) as rows_in_order
FROM
  user_actions
)

SELECT
  b.month_active AS mth,
  COUNT(DISTINCT a.user_id) AS monthly_active_users
FROM
  CTE as a
JOIN
  CTE as b 
ON
  a.user_id = b.user_id and a.month_active = 6 
  and b.month_active = 7 
  and a.year_active = 2022
GROUP BY
  b.month_active;
```