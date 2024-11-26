# Department Top Three Salaries

**Question link:** [Department Top Three Salaries](https://leetcode.com/problems/department-top-three-salaries/description/)

credits: Leetcode

## Solution:
```sql
WITH CTE AS(
    SELECT
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rn, 
        d.name AS Department, 
        e.name AS Employee, 
        e.salary
    FROM
        Employee e
    LEFT JOIN
        Department d
    ON
        e.departmentId = d.id
)

SELECT
    Department, Employee, salary
FROM
    CTE
WHERE
    rn <= 3;
```