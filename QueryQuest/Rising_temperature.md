# Rising Temperature

**Question link:** [Rising Temperature](https://leetcode.com/problems/rising-temperature/description/)

credits: Leetcode

## Solution:
```sql
SELECT
    w1.id as Id
FROM
    Weather w1
JOIN
    Weather w2
ON
    DATEDIFF(w1.recordDate, w2.recordDate) = 1
Where
    w1.temperature > w2.temperature;
```