# Second Day Confirmation

**Question link:** [Second Day Confirmation](https://datalemur.com/questions/second-day-confirmation)

credits: Leetcode


## Solution
```sql
SELECT
  DISTINCT user_id
FROM
  emails 
INNER JOIN
  texts
ON emails.email_id = texts.email_id
WHERE
  texts.action_date = emails.signup_date + INTERVAL '1 day'
  AND
  texts.signup_action = 'Confirmed';
```