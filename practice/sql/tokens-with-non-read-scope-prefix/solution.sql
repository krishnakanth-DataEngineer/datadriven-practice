select 
  count(distinct owner_id)
from api_tokens
where substring(scope,0,5)!= 'read'
