# Note: Let's assume that our tables already created in PostgreSQL as datastore with DDL before 

import psycopg2
import numpy as np
import psycopg2.extras as extras
import pandas as pd
  
  
def execute_values(conn, df, table):
  
    tuples = [tuple(x) for x in df.to_numpy()]
  
    cols = ','.join(list(df.columns))
    # SQL query to execute
    query = "INSERT INTO %s(%s) VALUES %%s" % (table, cols)
    cursor = conn.cursor()
    try:
        extras.execute_values(cursor, query, tuples)
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print("Error: %s" % error)
        conn.rollback()
        cursor.close()
        return 1
    print("the dataframe is inserted")
    cursor.close()
  
  
conn = psycopg2.connect(
    database="yelp", user='postgres', password='pass', host='localhost', port='5432'
)
  
list_table = ['checkin',
             'business',
             'review',
             'tip',
             'user'            
            ]
for x in list_table:
    df = pd.read_csv(f'/home/jodie/Downloads/yelp_dataset/yelp_dataset/answer/{x}.csv')

    execute_values(conn, df, f'{x}')
    print(f"success insert table {x}")
