with messages as (select
  author,
  trim(message) as message
from repo_commits
where message is not null and trim(message)!='')

select
  author,
  message,
  length(message) as message_length
from messages 
where length(message)> (select avg(length(message)) from messages)
order by message_length desc
