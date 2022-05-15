## Working With Excel

import pandas as pd

# Read excel file and print heads
excel_file = 'movies.xls'
movies = pd.read_excel(excel_file)
# print(movies.head())

# Selecting sheets and columns
# #choosing the first column, ‘Title’, as index (index=0) by passing zero
# #to the index_col argument.
movies_sheet1 = pd.read_excel(excel_file, sheet_name=0, index_col=0)
# print(movies_sheet1.head(10))
# It will print 10 rows from excel 
# Default is 5 rows

movies_sheet2 = pd.read_excel(excel_file, sheet_name=1, index_col=0)
# print(movies_sheet2.head())

movies_sheet3 = pd.read_excel(excel_file, sheet_name=2, index_col=1)
# print(movies_sheet3.head())

# By Default 5 rows are printed
# Also index_col= 1 makes 2nd col of exel to print first and rest after that
# but no column is skipped.


# Merging dataframes, i.e. merging all three sheets
#create a single DataFrame from all the three DataFrames, use the pandas concat method
movies = pd.concat([movies_sheet1, movies_sheet2, movies_sheet3])
# print(movies.shape)
# it just prints number of columns and rows

# Using the ExcelFile class to read multiple sheets
xlsx = pd.ExcelFile(excel_file)
movies_sheets = []
for sheet in xlsx.sheet_names:
   movies_sheets.append(xlsx.parse(sheet))
movies2 = pd.concat(movies_sheets)
# print(movies2.shape)

# the tail method to view the bottom rows.
# print(movies.tail())


# sorting in descending order
sorted_by_gross = movies.sort_values(['Gross Earnings'], ascending=False).head()
# print(sorted_by_gross)


# display the top 10 movies by Gross Earnings
# print(sorted_by_gross["Gross Earnings"].head(10))

# a histogram of IMDB Scores and bar graph of Gross Earnings to check the distribution of IMDB Scores across all movies

import matplotlib.pyplot as plt
# %matplotlib inline

excel = 'movies.xls'
movies_sheet1 = pd.read_excel(excel, sheet_name=0, index_col=0)
movies_sheet2 = pd.read_excel(excel, sheet_name=1, index_col=0)
movies_sheet3 = pd.read_excel(excel, sheet_name=2, index_col=0)
movies = pd.concat([movies_sheet1, movies_sheet2, movies_sheet3])
sortByGross = movies.sort_values(["Gross Earnings"], ascending=False).head(10)
# print(sortByGross)


sortByGross['Gross Earnings'].head(10).plot(kind="barh")
# plt.show()

# This line dosen't work :(
# sorted_by_gross["Gross Earnings"].head(10).plot(kind="barh")
# plt.show()

movies['IMDB Score'].plot(kind="hist")
# To see this graph first comment out the other plots
# plt.show()


# Getting statistical information about the data

# Describe method to get a statistical summary of the data set.
# The describe method displays below information for each of the columns.
# 1. The count or number of values
# 2. Mean
# 3. standard deviation
# 4. minimum, maximum
# 5. 25%, 50%, and 75% quantile
print(movies.describe())
# This will give the above details(mean, min, max, etc) of the int valued columns

# to get the mean,max,min of a particular column.

# print(movies["Gross Earnings"].mean())
# print(movies["Gross Earnings"].max())
# print(movies["Gross Earnings"].min())
# print(movies["Gross Earnings"].std())





