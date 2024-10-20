# The Report Problem Solution

**Question link:** [The report](https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true)

## Solution
```sql
SELECT 
    CASE
        WHEN g.grade > 7 THEN s.name
        WHEN g.grade < 8 THEN null
    END, 
    g.grade, 
    s.marks 
FROM students s JOIN grades g
WHERE
    s.marks >= g.min_mark AND s.marks <= g.max_mark
ORDER BY
    g.grade DESC, s.name ASC
