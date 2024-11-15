# Monthly Transactions I

**Question link:** [Monthly Transactions I](https://leetcode.com/problems/monthly-transactions-i/description/)

credits: Leetcode


## Solution 1
```sql
SELECT 
    Concat(substring(trans_date,1,7)) as month, 
    country,
    count(id) as trans_count ,
    sum(if(state='approved',1,0)) as approved_count, 
    sum(amount) as trans_total_amount, 
    sum(if(state='approved',amount,0)) as approved_total_amount
FROM
    Transactions
Group BY 
    month, country;
```


## Solution 2
```sql
SELECT
    LEFT(trans_date,7) AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(state = 'approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM((state = 'approved')*amount) AS approved_total_amount
FROM
    Transactions
GROUP BY
    month, country;
```