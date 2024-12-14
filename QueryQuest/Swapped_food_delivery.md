# Swapped Food Delivery

**Question link:** [Swapped Food Delivery](https://datalemur.com/questions/sql-swapped-food-delivery)

credits: Datalemur

## Solution:
```sql
WITH CTE AS (
SELECT
  count(order_id) as total_orders
FROM
  orders)
  

SELECT
  CASE
    WHEN order_id % 2 = 1 AND order_id != total_orders THEN order_id + 1
    WHEN order_id % 2 = 0 AND order_id != total_orders THEN order_id - 1
    ELSE order_id
  END AS corrected_order_id,
  item
FROM
  orders
CROSS JOIN
  CTE
ORDER BY
  corrected_order_id;
```