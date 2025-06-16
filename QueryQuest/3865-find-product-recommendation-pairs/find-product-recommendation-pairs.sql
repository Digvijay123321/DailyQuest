# Write your MySQL query statement below
select  p1.product_id AS product1_id, p2.product_id AS product2_id, 
    i1.category AS product1_category, i2.category AS product2_category, 
    COUNT(P1.user_id) AS customer_count
from productpurchases p1
inner join productpurchases p2 on p1.user_id = p2.user_id and p1.product_id < p2.product_id
left join productinfo i1 on p1.product_id = i1.product_id
left join productinfo i2 on p2.product_id = i2.product_id
group by product1_id,product2_id
having count(p1.user_id) >= 3
order by customer_count desc, product1_id, product2_id