select 
region
from orders 
where (lower(status) ='shipped' or lower(status) ='completed') and region is not null
group by region 
having max(profit)>1200
