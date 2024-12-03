# Tweets' Rolling Averages: Twitter

**Question link:** [Tweets' Rolling Averages: Twitter](https://datalemur.com/questions/rolling-average-tweets)

credits: Datalemur

## Solution:
```sql
SELECT
  user_id,
  tweet_date,
  Round(AVG(tweet_count) OVER(
    PARTITION BY user_id
    ORDER BY tweet_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS rolling_avg_3d
FROM
  tweets;
```