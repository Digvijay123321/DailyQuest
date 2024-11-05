# Product Sales Analysis I

**Question link:** [Product Sales Analysis I](https://leetcode.com/problems/product-sales-analysis-i/description/)

credits: Leetcode

## Solution:
```sql
SELECT p.product_name, s.year, s.price
FROM Sales s
LEFT JOIN Product p on s.product_id = p.product_id
ORDER BY s.year DESC;
```

In this solution there is no need to sort by year column. But it gives out most resent sales information for better understanding the data.