# Restaurant Growth

**Question link:** [Restaurant Growth](https://leetcode.com/problems/restaurant-growth/description/)

credits: Leetcode

## Solution:
```sql
SELECT 
    DISTINCT visited_on,
    sum(amount) OVER w AS amount,
    round((sum(amount) OVER w)/7, 2) AS average_amount
FROM customer
    WINDOW w AS ( 
        ORDER BY visited_on
        RANGE BETWEEN interval 6 day PRECEDING AND current ROW
    )
LIMIT 6, 10000;
```