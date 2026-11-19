select
  user_id,
  count(*) as total_views
from page_views 
where  date(viewed_at)<= '2025-12-28' and date(viewed_at)>= '2025-01-01'
group by user_id
