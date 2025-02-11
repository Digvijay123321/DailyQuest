# Well Paid Employees

**Question link:** [Well Paid Employees](https://datalemur.com/questions/sql-well-paid-employees)

credits: Datalemur

## Solution:
```sql
SELECT
  emp.employee_id, 
  emp.name as employee_name
FROM
  employee as emp
LEFT JOIN
  employee as manager
ON
  emp.manager_id = manager.employee_id
WHERE
  emp.salary > manager.salary;
```