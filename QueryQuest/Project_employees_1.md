# Project Employees I

**Question link:** [Project Employees I](https://leetcode.com/problems/project-employees-i/description/)

credits: Leetcode


## Solution 1
```sql
SELECT p.project_id, ROUND(SUM(emp.experience_years)/count(p.project_id), 2) as average_years
FROM Project AS p
LEFT JOIN Employee AS emp 
    ON p.employee_id = emp.employee_id
GROUP BY p.project_id;
```


## Solution 2
```sql
SELECT p.project_id , ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project AS p
LEFT JOIN  Employee AS e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;
```