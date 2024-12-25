# Histogram of Tweets

**Question link:** [Histogram of Tweets](https://datalemur.com/questions/sql-histogram-tweets)

credits: Datalemur

## Solution:
```sql
WITH CTE AS (
  SELECT
    user_id,
    Count(user_id) as twet_count
  FROM
    Tweets
  Where EXTRACT( YEAR from tweet_date) = 2022
  GROUP BY user_id
)

SELECT
  twet_count AS tweet_bucket,
  COUNT(user_id) AS user_num
FROM
  CTE 
GROUP BY
  twet_count;

```