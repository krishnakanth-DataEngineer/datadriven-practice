select
  department,
  avg(metric_value) as avg_value,
  min(metric_value) as min_value,
  max(metric_value) as max_value
from employee_metrics 
group by department
order by avg_value desc
