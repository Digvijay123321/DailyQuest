# Compressed Mode

**Question link:** [Compressed Mode](https://datalemur.com/questions/alibaba-compressed-mode)

credits: Datalemur

## Solution:
```sql
WITH main_table AS (
SELECT 
  *,
  rank() OVER(ORDER BY order_occurrences DESC) AS ranks
FROM 
  items_per_order)

SELECT
  item_count
FROM
  main_table
WHERE 
  ranks = 1;
```