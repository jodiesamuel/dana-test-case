-- fact_business
select distinct
    business_id,
    stars,
    review_count
from business 

-- fact_review
select distinct 
    review_id,
    user_id,
    business_id,
    stars
from review

-- dim_business
select 
    replace(business_id,"--","") as business_id,
    date
from business
where is_open <> 0

-- dim_checkin
select 
    *
from checkin

-- dim_tip
select 
    *
from tip

-- dim_user
select 
    *
from user

-- dim_review
select 
    *
from review
