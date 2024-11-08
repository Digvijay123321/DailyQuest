# Sales Analysis III

**Question link:** [Sales Analysis III](https://leetcode.com/problems/sales-analysis-iii/description/)

credits: Leetcode

Solution 1 is done using Joins and sub_query
## Solution 1
```sql
SELECT s.product_id, p.product_name
FROM Product AS p
LEFT JOIN Sales AS s
    ON s.product_id = p.product_id
WHERE s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
    AND s.product_id NOT IN ( SELECT product_id 
                            FROM Sales
                            WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31')
GROUP BY s.product_id;
```

In Solution 2 we used Min and Max function to filter our dates
## Solution 2
```sql
SELECT DISTINCT p.product_id, p.product_name
FROM Product p
LEFT JOIN Sales s
    ON p.product_id = s.product_id
GROUP BY s.product_id
HAVING MIN(s.sale_date)>='2019-01-01' AND MAX(s.sale_date)<='2019-03-31';
```