# Repeated Payments: Stripe

**Question link:** [Repeated Payments: Stripe](https://datalemur.com/questions/repeated-payments)

credits: Datalemur

## Solution:
```sql
WITH CTE AS(
  SELECT *,
    EXTRACT(MINUTE FROM t1.transaction_timestamp) AS t1_min,
    EXTRACT(HOUR FROM t1.transaction_timestamp) AS t1_hr,
    EXTRACT(MINUTE FROM t2.transaction_timestamp) AS t2_min,
    EXTRACT(HOUR FROM t2.transaction_timestamp) AS t2_hr
  FROM
    transactions t1
  JOIN
    transactions t2
  ON
    t1.transaction_id < t2.transaction_id AND
    t1.merchant_id = t2.merchant_id AND
    t1.credit_card_id = t2.credit_card_id AND
    t1.amount = t2.amount
)

SELECT
  count(*) as payment_count
FROM
  CTE
WHERE
  (t1_hr - t2_hr = 0) and (t1_min - t2_min >= -10);
```