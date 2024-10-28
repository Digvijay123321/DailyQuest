# Managers with at least 5 direct reports

**Question link:** [Managers with at least 5 direct reports](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/)

credits: Leetcode

Solution 1 is done using Joins 
## Solution 1
```sql
SELECT e.name
FROM Employee AS e 
INNER JOIN Employee AS m ON e.id=m.managerId 
GROUP BY m.managerId 
HAVING COUNT(m.managerId) >= 5;
```

Solution 2 is done using sub-query which is easer to understand
## Solution 2
```sql
SELECT name 
FROM Employee 
WHERE id IN (
    SELECT managerId 
    FROM Employee 
    GROUP BY managerId 
    HAVING COUNT(*) >= 5);
```