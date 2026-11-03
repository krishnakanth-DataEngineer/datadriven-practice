with og_date as (select
  ad_campaign,
  cast(substring(impression_time, 0,11) as date) as campaign_date,
  count(*) as day_count
  from ad_impressions
  group by ad_campaign , campaign_date),
 og_total as(
  select
    ad_campaign,
    sum(day_count) total_count,
    min(campaign_date) min_date,
    max(campaign_date) max_date
  from og_date
  group by ad_campaign
  )
  select
    d.ad_campaign,
    100.0 * CAST(d.day_count AS REAL) / t.total_count AS first_day_pct,
    100.0 * CAST(d2.day_count AS REAL) / t.total_count AS last_day_pct
    from og_date d join og_total t on d.ad_campaign= t.ad_campaign
    and t.min_date= d.campaign_date
    join og_date d2 on d2.ad_campaign= t.ad_campaign
    and t.max_date= d2.campaign_date
