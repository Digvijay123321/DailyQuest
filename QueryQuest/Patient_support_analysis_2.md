# Patient Support Analysis 2

**Question link:** [Patient Support Analysis 2](https://datalemur.com/questions/uncategorized-calls-percentage)

credits: Datalemur

## Solution:
```sql
SELECT 
ROUND(
  100 * count(case_id) / (SELECT count(case_id)*1.0 FROM callers), 1
  )
FROM
  callers
WHERE
  call_category in ('n/a') or call_category is NULL
```