# Product Price at a Given Date

**Question link:** [Product Price at a Given Date](https://leetcode.com/problems/product-price-at-a-given-date/description/)

credits: Leetcode

## Solution 1:
```sql
SELECT 
    p.product_id, COALESCE((SELECT new_price 
                                FROM 
                                    Products 
                                WHERE 
                                    product_id = p.product_id AND change_date <= '2019-08-16'
                                ORDER BY 
                                    change_date DESC 
                                LIMIT 1), 10) AS price
FROM
    (SELECT DISTINCT product_id 
     FROM Products) p;
```

## Solution 2:
```sql
WITH RankedProducts AS (
    SELECT
        product_id,
        new_price,
        RANK() OVER(
            PARTITION BY product_id
            ORDER BY change_date DESC
        ) AS `rank`
        FROM Products
        WHERE change_date <= '2019-08-16'
  ),
  ProductToLatestPrice AS (
    SELECT product_id, new_price
    FROM RankedProducts
    WHERE `rank` = 1
  )
SELECT
  Products.product_id,
  IFNULL(ProductToLatestPrice.new_price, 10) AS price
FROM Products
LEFT JOIN ProductToLatestPrice
  USING (product_id)
GROUP BY 1;
```
