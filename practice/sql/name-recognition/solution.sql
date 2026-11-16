with top_10_services as(select
  distinct svc_name
from 
  svc_health order by svc_name
limit 10)

select 
  svc_name,
  case when svc_name like '%api%' then 'api_service'
  when svc_name like '%cache%' then 'cache_service'
  when svc_name like '%redis%' then 'cache_service'
  when svc_name like '%db%' then 'database'
  when svc_name like  '%postgres%' then 'database'
  else 'other' end as category
from top_10_services
