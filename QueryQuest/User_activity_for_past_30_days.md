# User Activity for the Past 30 Days I

**Question link:** [User Activity for the Past 30 Days I](https://leetcode.com/problems/user-activity-for-the-past-30-days-i/description/)

credits: Leetcode

## Solution:
```sql
SELECT activity_date AS day,COUNT(DISTINCT user_id) AS active_users
FROM 
    Activity
GROUP BY 
    activity_date
HAVING 
    DATEDIFF("2019-07-27",activity_date)<30 
    AND DATEDIFF("2019-07-27",activity_date)>=0;
```

## Procedure Solution:
```sql
CREATE PROCEDURE GetActiveUsersInLast30Days(IN ref_date DATE)
BEGIN
    SELECT 
        activity_date AS day,
        COUNT(DISTINCT user_id) AS active_users
    FROM 
        Activity
    WHERE 
        DATEDIFF(ref_date, activity_date) < 30 
        AND DATEDIFF(ref_date, activity_date) >= 0
    GROUP BY 
        activity_date;
END;
```