select
  region,
  min(amount) as min_cost
from cloud_costs
group by region
