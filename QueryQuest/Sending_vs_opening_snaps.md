# Sending vs. Opening Snaps: Snapchat

**Question link:** [Sending vs. Opening Snaps: Snapchat](https://datalemur.com/questions/time-spent-snaps)

credits: Datalemur

## Solution:
```sql
WITH filtered_users AS(
  SELECT
    a2.age_bucket AS age_bucket,
    SUM(time_spent) FILTER (WHERE activity_type = 'send') AS send,
    SUM(time_spent) FILTER (WHERE activity_type = 'open') AS open
  FROM
    activities a1
  LEFT JOIN
    age_breakdown a2
  ON 
    a1.user_id = a2.user_id
  GROUP BY
    a2.age_bucket
)


SELECT
  age_bucket,
  ROUND(100 * send / (send+open), 2) AS send_perc,
  ROUND(100 * open / (send+open), 2) AS open_perc
FROM
  filtered_users;
```