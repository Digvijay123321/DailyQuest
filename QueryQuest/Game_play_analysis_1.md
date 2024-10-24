# Game Play Analysis I

**Question link:** [Game Play Analysis I](https://leetcode.com/problems/game-play-analysis-i/description/)

credits: Leetcode

## Solution:
```sql
SELECT player_id, min(event_date) AS first_login
FROM Activity
GROUP BY player_id;
```