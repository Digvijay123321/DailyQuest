# Average Post Hiatus

**Question link:** [Average Post Hiatus](https://datalemur.com/questions/sql-average-post-hiatus-1)

credits: Datalemur

## Solution:
```sql
SELECT 
	user_id, 
  MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM
  posts
WHERE
  DATE_PART('year', post_date::DATE) = 2021 
GROUP BY
  user_id
HAVING
  COUNT(post_id) > 1;
```