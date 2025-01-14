# Duplicate Job Listings

**Question link:** [Duplicate Job Listings](https://datalemur.com/questions/duplicate-job-listings)

credits: Datalemur

## Solution:
```sql
WITH company_with_duplicate_job_list AS (
SELECT 
  company_id
FROM
  job_listings
GROUP BY
  company_id, title, description
HAVING
  COUNT(job_id) > 1)
  
SELECT
  COUNT(*)
FROM
  company_with_duplicate_job_list;
```