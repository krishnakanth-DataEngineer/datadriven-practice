with impression as (select 
  ad_campaign,
  revenue,
  case when clicked is True then 1 else 0 end as clicks
  from ad_impressions)

select
  ad_campaign,
  count(*) as impressions,
  sum(revenue) as total_revenue,
  ROUND(
    CAST(SUM(clicks) AS DOUBLE) * 100 / COUNT(*),
    1
) AS ctr
from impression
group by ad_campaign
having count(*)>15
order by ctr desc, ad_campaign
