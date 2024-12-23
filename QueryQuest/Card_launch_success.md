# Card Launch Success

**Question link:** [Card Launch Success](https://datalemur.com/questions/card-launch-success)

credits: Datalemur

## Solution:
```sql
WITH sorted_cte AS
(SELECT
  *,
  rank() OVER(partition by card_name order by issue_year, issue_month) as rank_by_issue_month
FROM
  monthly_cards_issued)

SELECT
  card_name,
  issued_amount
FROM
  sorted_cte
WHERE
  rank_by_issue_month = 1
ORDER BY
  issued_amount DESC;
```