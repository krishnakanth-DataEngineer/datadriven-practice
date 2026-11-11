with transactions as(
select
  feat_name,
  dtype,
  avg_val,
  null_pct
  from 
    ml_features where source='transactions'),
page_views as(
select
  feat_name,
  dtype,
  avg_val,
  null_pct
  from 
    ml_features where source='page_views'),
ad_impressions as(
select
  feat_name,
  dtype,
  avg_val,
  null_pct
  from 
    ml_features where source='ad_impressions')
select
  t.feat_name,
  lower(t.dtype),
  avg(t.avg_val) as avg_val,
  avg(t.null_pct) as null_pct
from transactions t left join page_views p 
on lower(t.feat_name)=lower(p.feat_name) and lower(t.dtype)=lower(p.dtype)
left join ad_impressions a 
on lower(t.feat_name)=lower(a.feat_name) and lower(t.dtype)=lower(a.dtype)
where p.feat_name is null and a.feat_name is null
group by t.feat_name , lower(t.dtype)
