select
  p.category,
  sum(t.quantity * p.price) as total_revenue
from transactions t
join products p
on t.product_id =p.product_id
group by p.category
