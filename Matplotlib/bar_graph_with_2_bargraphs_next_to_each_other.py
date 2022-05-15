import matplotlib.pyplot as plt
import numpy as np

dept = ["CS","IT","BT","BMM"]
male_avg_salary = [20,40,30,45]
female_avg_salary = [30,45,50,10]
index = np.arange(4)
width=0.30
plt.bar(index,male_avg_salary,width, color='green',label='Male Avg Salary')
plt.bar(index+width,female_avg_salary,width, color='red',label='Female Avg Salary')
# plt.bar(index+(2*width),male_avg_salary,width, color='green',label='Male Avg Salary')
plt.title('~~~ Avreage Salary ~~~~')
plt.xlabel("Department")
plt.ylabel("Salary")
plt.xticks(index + width/2, dept)
# The location of x axis elements.
plt.legend(loc='best')
plt.show()
