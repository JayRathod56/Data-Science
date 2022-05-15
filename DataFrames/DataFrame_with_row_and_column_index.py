#Dataframe with row and column indexes
import pandas as pd

#Initialise data to lists.
data = [{'Python':30, 'DBMS':80, 'Data Science':70},
        {'Python':50, 'DBMS':60, 'Data Science':90},
        {'Python':70, 'DBMS':40, 'Data Science':50}]

# Creates DataFrame
df1 = pd.DataFrame(data, columns = ['Python' , 'DBMS'])
df2 = pd.DataFrame(data, columns = ['DBMS','Data Science'])
df3 = pd.DataFrame(data, columns = ['Python','Data Science'])
# It wil only print those values which column names are specified...


# Print the data
print(df1)
print('-'*50)
print(df2)
print('-'*50)
print(df3)
