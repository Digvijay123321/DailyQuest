# Triangle Judgement

**Question link:** [Triangle Judgement](https://leetcode.com/problems/triangle-judgement/description/)

credits: Leetcode


```sql
SELECT x,y,z, (
    CASE
        WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
        ELSE 'No'
    END ) AS triangle 
FROM Triangle;
```