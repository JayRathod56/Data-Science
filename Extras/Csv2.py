# Importing csv
import csv

def read_csv():
    print("-"*10,"Program to read CSV files","-"*10)

    with open("CSV_Files/Faculty.csv", 'r') as csvfile:
        # Reader is an object of a given file
        # newline doesn't do anythig it is just for a format to print things
        reader = csv.reader(csvfile, delimiter="_")
        for row in reader:
            print(row)

    # this prints values in a list
read_csv()