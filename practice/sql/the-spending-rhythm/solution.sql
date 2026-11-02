select
  user_id,
  substring(transaction_date, 1, 7) as month,
  count(*) as transaction_count
from transactions
group by user_id, substring(transaction_date, 1, 7)
order by user_id
