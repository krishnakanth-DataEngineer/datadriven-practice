select
  user_id,
  count(*) as total_sessions
from user_sessions
group by user_id
having count(*)>(select
  count(*)/count(distinct user_id) as avg_count
from user_sessions)
order by total_sessions desc, user_id
