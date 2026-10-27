select
  p.product_name,
  temp_transactions.total_revenue
  from 
(select
  product_id,
  total_revenue,
  row_number() over(order by total_revenue desc, product_id) as rnk
from (select
  product_id,
  sum(total_amount) as total_revenue
  from transactions
  group by product_id) temp ) temp_transactions join  products p
  on p.product_id=temp_transactions.product_id
  where rnk<=6
