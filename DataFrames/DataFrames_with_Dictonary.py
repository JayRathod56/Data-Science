# Data Frames with Dictionary

import pandas as pd

# Creating dictionary : key becomes column heads and values are i cell
studcourse = {'Name':['Angel','Jay'],'Course':['Java','Data Science']}

#Create DataFrame : index gives label to rows
df1 = pd.DataFrame(studcourse, index=['CEC01', 'CEC02'])
df2 = pd.DataFrame({'Maharashtra':[10,20,30], 'Delhi':[30,20,10], 'United States':[0,2,3]}, index=[1,2,3])

# Printing the output
print(df1)
print('-'*50)
print(df2)

