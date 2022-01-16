-- clean business dataset

select 
    *
from yelp_academic_dataset_business
where is_open = 1
