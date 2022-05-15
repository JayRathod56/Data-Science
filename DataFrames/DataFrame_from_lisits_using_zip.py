#DataFrame from lists using zip
import pandas as pd

#List1
Name = ['Angel', 'Jay', 'Gavin']
# The Name Gavin will not be printed beacause there is no corresponding data in Age....

#list2
Age = [20,19]

#merge list using zip()
list_of_tuples = list(zip(Name, Age))

#Assign data to tuples
print(list_of_tuples)

# Converting lists of tuples into pandas Dataframe
df = pd.DataFrame(list_of_tuples,columns = ['Name','Age'], index= [1,2])

#Printing data
print(df)
