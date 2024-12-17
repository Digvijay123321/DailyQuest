# Signup Activation Rate

**Question link:** [Signup Activation Rate](https://datalemur.com/questions/signup-confirmation-rate)

credits: Datalemur

## Solution:
```sql
With CTE AS(
SELECT
  count(*) FILTER (WHERE signup_action = 'Confirmed') AS confirmed_users,
  count(distinct e.user_id) AS all_users
FROM
  emails as e
LEFT JOIN
  texts as t
ON
  e.email_id = t.email_id
)

SELECT
  ROUND(confirmed_users*1.0/all_users*1.0, 2) AS confirm_rate
FROM
  CTE;
```