with req_users as (select distinct user_id,product_id from transactions 
                 where  total_amount <500)

select 
  r.user_id,
  count(distinct p.category) as category_count
from req_users r
join products p
on r.product_id=p.product_id
group by r.user_id
having count(distinct p.category)>1
order by category_count desc
