with cte as (

select 

to_timestamp(STARTED_AT) as timestamp ,
date(to_timestamp(STARTED_AT)) as date_started_at,
hour(to_timestamp(STARTED_AT)) as hour,

{{day_type('STARTED_AT')}} as day_type,

{{get_season('STARTED_AT')}}  AS STATION_OF_YEAR

from 
{{ source('demo', 'bike') }}
where STARTED_AT != 'started_at'
)

select * from cte