# Customers Who Bought All Products

**Question link:** [Customers Who Bought All Products](https://leetcode.com/problems/customers-who-bought-all-products/description/)

credits: Leetcode

## Solution 1:
```sql
SELECT customer_id
FROM customer c
GROUP BY customer_id
HAVING count(distinct product_key)=(SELECT count(distinct product_key) 
                                    FROM product);
```