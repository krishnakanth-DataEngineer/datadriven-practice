with e_api_calls as(select
  *,
  case when hour(call_time)<12 then 'Morning'
       when hour(call_time)>=12 and hour(call_time)<=15 then 'Early Afternoon'
       else 'Late Afternoon' end as time_segment
from api_calls 
where err_msg is not null),

extracted as (select
  status, time_segment, count(*) as call_count,
  case when time_segment='Morning' then 12
       when time_segment='Early Afternoon' then 4
       else 8 end as hours
from e_api_calls
group by status, time_segment),

ranked as (select
  status, time_segment, call_count, 
  CAST(call_count AS DECIMAL(18, 4)) / hours as failures_per_hour,
  dense_rank() 
    over(
         order by CAST(call_count AS DECIMAL(18, 4)) / hours desc) as rnk 
from extracted )

select
  status, time_segment, call_count, failures_per_hour
  from ranked where rnk<=4
  order by  failures_per_hour desc
