with req_users as (select distinct user_id,product_id from transactions 
                 where  total_amount <500)

select 
  t.user_id,
  count(distinct p.category) as category_count
from req_users r
join transactions t
on t.user_id =r.user_id and t.product_id=r.product_id
join products p
on t.product_id=p.product_id
group by t.user_id
having count(distinct p.category)>1
order by category_count desc
