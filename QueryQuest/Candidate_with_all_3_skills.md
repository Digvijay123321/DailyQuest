# Data Science Skills LinkedIn

**Question link:** [Data Science Skills LinkedIn](https://datalemur.com/questions/matching-skills)

credits: Datalemur

## Solution:
```sql
SELECT candidate_id
FROM candidates
WHERE skill in ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING count(skill) = 3;
```