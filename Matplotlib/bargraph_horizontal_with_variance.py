import matplotlib.pyplot as plt
import numpy as np
students = ["Jay","Shakti","Kishore"]
marks = [100,90, 40]
variance = [5,8,10]
# To make bargraph horizontal we use barh and for vertical (default) we use bar
plt.barh(students,marks,xerr = variance, color='green')
# xerr is varience shown on the bars as a black line
plt.title('~~~ Students Marks ~~~~')
plt.xlabel("Students")
plt.ylabel("Marks")
plt.show()
