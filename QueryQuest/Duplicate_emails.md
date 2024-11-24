# Duplicate Emails

**Question link:** [Duplicate Emails](https://leetcode.com/problems/duplicate-emails/description/)

credits: Leetcode

## Solution:
```sql
SELECT
    email
FROM
    Person
GROUP BY
    email
HAVING
    COUNT(email) > 1;
```