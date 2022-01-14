import pandas as pd

list_data = ['yelp_academic_dataset_checkin',
             'yelp_academic_dataset_business',
             'yelp_academic_dataset_review',
             'yelp_academic_dataset_tip',
             'yelp_academic_dataset_user'            
            ]

for x in list_data:
    # Read Json
    json_path = f'/home/jodie/Downloads/yelp_dataset/yelp_dataset/{x}.json'
    df = pd.read_json(json_path, lines=True)
    # Save as csv
    df.to_csv(f'/home/jodie/Downloads/yelp_dataset/yelp_dataset/answer/{x}.csv', index=False)
