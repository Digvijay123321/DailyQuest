# Sales Person

**Question link:** [Sales Person](https://leetcode.com/problems/sales-person/description/)

credits: Leetcode


```sql
SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT sales_id
    FROM Orders o
    JOIN Company c ON o.com_id = c.com_id
    WHERE name = 'RED'
);
```