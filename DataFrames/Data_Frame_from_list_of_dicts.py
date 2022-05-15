# Creating Dataframe From list of dicts
import pandas as pd 

# Initialise data to lists
data =  [{'Python': 50, 'DBMS':25, 'Data Science':30, 'Data':50},
        {'Python':70, 'DBMS':72, 'Data Science':50, 'Data': 30},
        {'Python':80, 'DBMS':97, 'Data':88}]

# Creates DataFrames
df = pd.DataFrame(data, index=['Ravishankar','Omkar','Ujwal'])    
#  The index are row names and data is dictionary within a list
# # column names are keys of dictionary    

# Print the data
print(df)