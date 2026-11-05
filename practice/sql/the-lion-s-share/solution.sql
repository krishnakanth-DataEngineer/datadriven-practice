select
  p.category as category,
  sum(total_amount) as total_revenue,
  count(*) as transaction_count
from transactions t
join products p
on t.product_id=p.product_id
group by p.category
order by sum(total_amount) desc
