# Teams Power Users

**Question link:** [Teams Power Users](https://datalemur.com/questions/teams-power-users)

credits: Datalemur

## Solution:
```sql
SELECT 
  sender_id,
  COUNT(message_id) AS count_messages
FROM
  messages
WHERE
  EXTRACT(MONTH FROM sent_date) = '8' AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY
  sender_id
ORDER BY
  count_messages DESC
LIMIT 2; 
```