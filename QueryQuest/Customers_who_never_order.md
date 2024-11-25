# Customers Who Never Order

**Question link:** [Customers Who Never Order](https://leetcode.com/problems/customers-who-never-order/description/)

credits: Leetcode

## Solution:
```sql
SELECT
    name AS Customers
FROM
    Customers
WHERE
    id NOT IN (
            SELECT customerId
            FROM Orders
        );
```