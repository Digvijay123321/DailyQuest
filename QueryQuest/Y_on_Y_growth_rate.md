# Y-on-Y Growth Rate: Wayfair

**Question link:** [Y-on-Y Growth Rate: Wayfair](https://datalemur.com/questions/yoy-growth-rate)

credits: Datalemur

## Solution:
```sql
SELECT
  EXTRACT(YEAR FROM transaction_date) AS yr,
  product_id,
  spend AS curr_year_spend,
  LAG(spend) OVER(PARTITION BY product_id ORDER BY transaction_date) AS prev_year_spend,
  ROUND(((spend	- LAG(spend) OVER(PARTITION BY product_id ORDER BY transaction_date))/LAG(spend) OVER(PARTITION BY product_id ORDER BY transaction_date))*100, 2) AS yoy_rate
FROM
  user_transactions;
```