# Write your MySQL query statement below
with name as (
    select u.name, count(*) as count_of_rateings
    from movierating as m
    left join users as u on u.user_id = m.user_id
    group by m.user_id
    order by count_of_rateings desc, u.name
    limit 1
), movie as (
    select m.title, avg(rating) as avg_rate
    from movierating as mr
    left join movies as m on m.movie_id = mr.movie_id
    where year(created_at) = 2020 and month(created_at) = 02
    group by mr.movie_id
    order by avg_rate desc, m.title
    limit 1
)
select name as results from name
union all
select title from movie
