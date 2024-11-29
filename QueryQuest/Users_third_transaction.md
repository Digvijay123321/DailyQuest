# User's Third Transaction: Uber

**Question link:** [User's Third Transaction: Uber](https://datalemur.com/questions?difficulty=Medium)

credits: Datalemur

## Solution:
```sql
WITH CTE AS (SELECT 
  user_id,
  spend,
  transaction_date,
  Dense_rank() OVER(PARTITION BY user_id order by transaction_date ASC) AS r
FROM transactions)

SELECT user_id, spend, transaction_date
FROM CTE
WHERE r = 3;
```