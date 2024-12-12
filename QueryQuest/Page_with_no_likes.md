# Page With No Likes

**Question link:** [Page With No Likes](https://datalemur.com/questions/sql-page-with-no-likes)

credits: Datalemur

## Solution:
```sql
SELECT page_id
FROM pages
WHERE NOT EXISTS (
  SELECT page_id
  FROM page_likes AS likes
  WHERE likes.page_id = pages.page_id
)
ORDER BY
  page_id;
```