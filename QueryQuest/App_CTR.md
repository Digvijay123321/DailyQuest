# App Click-through Rate (CTR)

**Question link:** [App Click-through Rate (CTR)](https://datalemur.com/questions/click-through-rate)

credits: Datalemur

## Solution:
```sql
SELECT
  app_id,
  ROUND(100.0 * SUM(1) FILTER (WHERE event_type = 'click') /
    SUM(1) FILTER (WHERE event_type = 'impression'), 2) AS ctr_app
FROM
    events
WHERE
    timestamp >= '2022-01-01' AND timestamp < '2023-01-01'
GROUP BY
    app_id;
```


