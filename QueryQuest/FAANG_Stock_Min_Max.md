# FAANG Stock Min-Max

**Question link:** [FAANG Stock Min-Max](https://datalemur.com/questions/sql-bloomberg-stock-min-max-1)

credits: Datalemur

## Solution:
```sql
WITH max_min AS( 
SELECT ticker, max(open) as highest_open, min(open) as lowest_open FROM stock_prices GROUP BY ticker
), max_opens AS (
SELECT
  a.ticker,
  TO_CHAR(date, 'Mon-YYYY') as highest_mth,
  a.date,
  highest_open
FROM
  stock_prices as a
JOIN
  max_min as b
ON
  a.ticker = b.ticker AND
  a.open = b.highest_open
), min_opens AS (
SELECT
  a.ticker,
  TO_CHAR(date, 'Mon-YYYY') AS lowest_mth,
  a.date,
  lowest_open
FROM
  stock_prices as a
JOIN
  max_min as b
ON
  a.ticker = b.ticker AND
  a.open = b.lowest_open
), main_table AS(
SELECT
  ma.ticker,
  highest_mth,
  highest_open,
  lowest_mth,
  lowest_open
FROM
  max_opens as ma
JOIN
  min_opens as mb
ON
  ma.ticker = mb.ticker
)

SELECT
  *
FROM
  main_table
ORDER BY
  ticker;
  
```