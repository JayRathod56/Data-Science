import csv

print("-"*10,"Program to create csv files","-"*10)

with open("CSV_Files/Courses.csv", 'w') as csvfile:
    #wirter is an object

    wr = csv.writer(csvfile)
    wr.writerow(["C-id,","c_Title", "C_Fees"])
    wr.writerow([1, "Python Basics", "15000"])

print("Courses.csv file Created!!!")