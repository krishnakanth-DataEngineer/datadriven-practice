select
  user_id,
  count(*) as query_count,
  row_number() over(order by cast(user_id as varchar)) as rnk
  from search_queries
  group by user_id
  order by query_count desc, cast(user_id as varchar)
