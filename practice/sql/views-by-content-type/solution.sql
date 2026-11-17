select
  ci.content_type,
  count(*) as view_count
from
  content_views cv join content_items ci
on cv.content_id = ci.content_id
group by ci.content_type
