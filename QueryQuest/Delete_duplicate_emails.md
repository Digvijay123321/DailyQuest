# Delete Duplicate Emails

**Question link:** [Delete Duplicate Emails](https://leetcode.com/problems/delete-duplicate-emails/description/)

credits: Leetcode

## Solution:
```sql
DELETE
    p1.*
FROM
    Person p1
JOIN(
    SELECT email, min(id) as id
    FROM Person
    GROUP BY email
) AS p2
WHERE
    p1.email = p2.email AND p1.id > p2.id;
```