with total_costs as (
select amount, region,svc_name from cloud_costs
union
select amount, region,svc_name from cost_allocs
),

desc_costs as (
select *,
row_number() over(partition by region order by amount desc) as high_rnk
from total_costs),

asc_costs as (
select *,
row_number() over(partition by region order by amount) as low_rnk
from total_costs)





select a.region,a.svc_name , d.svc_name
from asc_costs a
join desc_costs d 
on a.region=d.region and a.low_rnk=d.high_rnk
where a.low_rnk=1
