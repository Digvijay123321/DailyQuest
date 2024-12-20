# User Shopping Sprees

**Question link:** [User Shopping Sprees](https://datalemur.com/questions/amazon-shopping-spree)

credits: Datalemur

## Solution:
```sql
SELECT
  t1.user_id
FROM
  transactions as t1
JOIN
  transactions as t2
ON
  date(t1.transaction_date) = date(t2.transaction_date)-1
GROUP BY
  t1.user_id
HAVING
  count(*) >= 2
ORDER BY
  t1.user_id;
```