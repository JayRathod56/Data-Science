import matplotlib.pyplot as plt
import numpy as np

dept = ["CS","IT","BT","BMM"]
male_avg_age = [20,40,30,45]
female_avg_age = [30,45,50,10]
index = np.arange(4)
width=0.30
plt.bar(index,male_avg_age,width, color='green',label='Male Avg Salary')
plt.bar(index,female_avg_age,width, color='red',label='Female Avg Salary',bottom =male_avg_age  )
plt.title('~~~ Avreage Salary ~~~~')
plt.xlabel("Department")
plt.ylabel("Salary")
plt.xticks(index, dept)
plt.legend(loc='best')
plt.show()


