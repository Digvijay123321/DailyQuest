# Unfinished Parts

**Question link:** [Unfinished Parts](https://datalemur.com/questions/tesla-unfinished-parts)

credits: Datalemur

## Solution:
```sql
SELECT
  part,
  assembly_step
FROM
  parts_assembly
WHERE
  finish_date IS NULL;
```