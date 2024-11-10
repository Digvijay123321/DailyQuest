# Article Views I

**Question link:** [Article Views I](https://leetcode.com/problems/article-views-i/description/)

credits: Leetcode

## Solution:
```sql
SELECT 
    DISTINCT author_id AS id
FROM
    Views
WHERE
    author_id = viewer_id
ORDER BY
    id ASC;
```

## Procedure Solution:
```sql
CREATE PROCEDURE Get_author_id_who_viewed_their_own_work_atleast_ones(IN ref_date DATE)
BEGIN
    SELECT 
        DISTINCT author_id AS id
    FROM
        Views
    WHERE
        author_id = viewer_id
    ORDER BY
        id ASC;
END;
```

## To call the procedure:
```sql
CALL Get_author_id_who_viewed_their_own_work_atleast_ones();
```