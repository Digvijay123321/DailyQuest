# Employees Earning More Than Their Managers

**Question link:** [Employees Earning More Than Their Managers](https://leetcode.com/problems/employees-earning-more-than-their-managers/description/)
credits: Leetcode

Solution 1 is done using Joins 
## Solution 1
```sql
SELECT e.name AS Employee
FROM Employee AS e 
JOIN Employee AS m ON e.managerId = m.id
WHERE e.salary > m.salary
```

solution 2 is done using sub-query which is easer to understand
## Solution 2
```sql
SELECT e.name as Employee
FROM employee as e
WHERE e.salary > (
    SELECT m.salary
    FROM employee m
    WHERE e.managerID = m.id
)
```