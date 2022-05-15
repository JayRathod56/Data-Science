import csv

csv_rowlist = [["ID", "Songs", "Genre"], [1, "Summer of 69", "Rock"], [2, 'Madhuban', "Classical"]]

with open("CSV_Files/Songs.csv",'w') as csvfile:

    writer = csv.writer(csvfile)
    writer.writerows(csv_rowlist)

print("Songs File Has been Successfully Created!!!")