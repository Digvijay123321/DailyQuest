# Cities With Completed Trades

**Question link:** [Cities With Completed Trades](https://datalemur.com/questions/completed-trades)

credits: Datalemur

## Solution:
```sql
SELECT
  city,
  count(*) as total_orders
FROM
  trades as t
LEFT JOIN
  users as u
ON
  t.user_id = u.user_id
WHERE
  status = 'Completed'
GROUP BY
  city
ORDER BY
  total_orders DESC, city
LIMIT
  3;
```