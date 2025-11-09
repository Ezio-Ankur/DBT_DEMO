with cte as (

select 

to_timestamp(STARTED_AT) as timestamp ,
date(to_timestamp(STARTED_AT)) as date_started_at,
hour(to_timestamp(STARTED_AT)) as hour,
case 
when dayname(to_timestamp(STARTED_AT)) in ('Sat','Sun') 
then 'WEEKEND'
else 'BUSINESS'
END AS DAY_TYPE,
case when month(to_timestamp(STARTED_AT)) in (12,1,2) then 'WINTER'
WHEN month(to_timestamp(STARTED_AT)) in (3,4,5) then 'SPRING'
WHEN month(to_timestamp(STARTED_AT)) in (6,7,8) then 'SUMMER'
ELSE 'AUTUMN'
END AS STATION_OF_YEAR

from 
{{ source('demo', 'bike') }}
where STARTED_AT != 'started_at'
)

select * from cte