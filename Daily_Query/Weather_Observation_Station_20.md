# Weather Observation Station 20 Problem Solution

**Question link:** [Weather Observation Station 20](https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true)

credits: HackerRank

## Solution
```sql
SELECT ROUND(AVG(LAT_N), 4)
FROM (
    SELECT 
      ROW_NUMBER() OVER (ORDER BY s.LAT_N) rn,
      s.LAT_N,
      COUNT(s.LAT_N) OVER() / 2 median_rn
    FROM Station s
) AS subquery
WHERE rn BETWEEN median_rn AND median_rn + 1
```

1. This query assigns a row number to each latitude entry, sorted in ascending order.
2. Calculates the median row number based on the total count of latitude values.
3. In the outer query, it selects the average of the latitude values corresponding to the median row(s) and rounds it to four decimal places.
