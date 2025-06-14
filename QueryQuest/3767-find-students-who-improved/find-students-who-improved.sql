# Write your MySQL query statement below
with cte as (
    select *,
        row_number() over(partition by student_id, subject order by exam_date) as test_taken,
        first_value(score) over(partition by student_id, subject order by exam_date) as first_score,
        last_value(score) over(partition by student_id, subject order by exam_date range between current row and unbounded following) as latest_score
    from scores
)

select student_id, subject, first_score, latest_score
from cte
where first_score < latest_score
group by student_id, subject;
