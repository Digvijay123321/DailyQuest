# Laptop vs. Mobile Viewership

**Question link:** [Laptop vs. Mobile Viewership](https://datalemur.com/questions/laptop-mobile-viewership)

credits: Datalemur

## Solution:
```sql
SELECT 
  COUNT(*) FILTER (WHERE device_type = 'laptop') AS laptop_views,
  COUNT(*) FILTER (WHERE device_type IN ('tablet', 'phone'))  AS mobile_views 
FROM
  viewership;
```