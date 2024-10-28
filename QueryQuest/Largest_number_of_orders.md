# Customer Placing the Largest Number of Orders

**Question link:** [Customer Placing the Largest Number of Orders](https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/description/)

credits: Leetcode



## Solution:
```sql
SELECT customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(customer_number) DESC
LIMIT 1;
```