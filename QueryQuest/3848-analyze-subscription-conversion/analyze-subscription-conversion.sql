# Write your MySQL query statement below
with cte as (
    select *,
        if(activity_type = "free_trial", avg(activity_duration), 0) as trial_avg_duration,
        if(activity_type = "paid", avg(activity_duration), 0) as paid_avg_duration
    from useractivity
    where activity_type != "cancelled"
    group by user_id, activity_type
)

select user_id, round(sum(trial_avg_duration), 2) as trial_avg_duration, round(sum(paid_avg_duration), 2) as paid_avg_duration
from cte
group by user_id
having sum(if(activity_type='paid', 1, 0)) >= 1
order by user_id
