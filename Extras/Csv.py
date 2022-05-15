# Importing csv
import csv

def read_csv():
    print("-"*10,"Program to read CSV files","-"*10)

    with open("CSV_Files/Test_File.csv", newline='') as csvfile:
        # Reader is an object of a given file
        # newline doesn't do anythig it is just for a format to print things
        reader = csv.reader(csvfile, delimiter=",")
        # Just Fuck the error solved by Visual Code  
        for row in reader:
            print(row)

    # this prints values in a list
read_csv()