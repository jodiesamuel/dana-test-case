with 
    review as (
        select 
            r.business_id,
            date(r.date) as date,
            avg(r.stars) as avg_stars
        from dim_review r 
        group by 1 
    ),
    temperature as (
        select 
            date(date) as date,
            min_temperature,
            max_temperature
        from temperature
        where normal_max <= 30 and normal_min >= 100
    )
select 
    r.business_id,
    r.date,
    r.avg_stars
from temperature t 
left join review r on r.date = t.date
order by t.date
