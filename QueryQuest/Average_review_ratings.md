# Average Review Ratings

**Question link:** [Average Review Ratings](https://datalemur.com/questions/sql-avg-review-ratings)

credits: Datalemur

## Solution:
```sql
SELECT 
  EXTRACT(MONTH FROM submit_date) AS mth,
  product_id,
  ROUND(AVG(stars), 2) AS avg_stars
FROM
  reviews
GROUP BY 
  EXTRACT(MONTH FROM submit_date), 
  product_id
ORDER BY
  mth, product_id;
```