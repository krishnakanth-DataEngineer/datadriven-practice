with sessions as(select
  flag_name,
  replace(flag_name,'_',' ') as display_name,
  enabled,
  created,
  case when session_start is  null then 0
       else 1 end as value
from feat_flags
left join
  user_sessions 
on created<= session_start
      and datediff(day, created, session_start)<30)

select
  flag_name,display_name,enabled, 
  sum(value) as launch_window_sessions
from sessions
group by flag_name,display_name,enabled,created
