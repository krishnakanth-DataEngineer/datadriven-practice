select
  user_id,
  query_count,
  row_number() over(order by cast(user_id as varchar)) as rnk
  from
(select
  user_id,
  count(*) as query_count
  from search_queries
  group by user_id
  order by query_count desc, cast(user_id as varchar)) temp
