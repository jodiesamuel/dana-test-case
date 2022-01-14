TABLE business  as B {
     business_id  varchar [ref: > R.business_id] 
     name   LONGTEX 
     address CHAR
     city CHAR
     state CHAR
     postal_code  CHAR
     latitude  CHAR 
     longitude CHAR
     stars INT
     review_count INT 
     is_open BOOLEAN
     attributes LONGTEXT
     categories LONGTEXT
     hours LONGTEXT
        }
        
TABLE checkin  as C {
     business_id varchar  [ref: > B.business_id] 
     date  timestamp
        }
         
TABLE tip  as T {
     user_id varchar  
     business_id varchar  
     text  varchar
     date timestamp
     compliment_count int 
        }
        
Ref: T.user_id > U.user_id  
Ref: T.business_id > B.business_id  

TABLE user  as Y {
     user_id varchar [ref: > R.user_id] 
     name   varchar
     review_count INT
     yelping_since TIMESTAMP 
     useful INT
     funny INT  
     cool  INT  
     elite varchar 
     friends varchar
     fans INT  
     average_stars FLOAT  
     compliment_hot  INT 
     compliment_more  INT 
     compliment_profile INT 
     compliment_cute  INT  
     compliment_list  INT 
     compliment_note  INT  
     compliment_plain INT  
     compliment_cool  INT  
     compliment_funny INT   
     compliment_writer INT  
     compliment_photos INT  
        }
  
TABLE review  as R {
     review_id varchar
     user_id varchar
     business_id varchar
     stars INT 
     useful INT 
     funny INT
     cool  INT
     text  varchar 
     date timestamp
     }
