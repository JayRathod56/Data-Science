import pandas as pd
print("Panda Imported...")

# Data Frame with list
# list of strings
courseList = ['Java', 'DBMS', 'Python']

# Calling DataFrame constructor on list
df1 = pd.DataFrame(courseList, columns=['Subjects'])
df2 = pd.DataFrame([[10,20,30], ['a','b','c'], ['aa','bb']])
print(df1)
print('-'*50)
print(df2)
