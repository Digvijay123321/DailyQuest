# International Call Percentage

**Question link:** [International Call Percentage](https://datalemur.com/questions/international-call-percentage)

credits: Datalemur

## Solution:
```sql
WITH international_calls AS (SELECT
  a.caller_id AS caller_id,
  a.receiver_id AS receiver_id,
  b.country_id AS caller_country,
  c.country_id AS receiver_country
FROM
  phone_calls AS a
LEFT JOIN
  phone_info AS b ON a.caller_id = b.caller_id
LEFT JOIN
  phone_info AS c ON a.receiver_id = c.caller_id
WHERE
  b.country_id <> c.country_id
)

SELECT 
  ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM phone_calls),1) AS international_call_pct
FROM international_calls;
```