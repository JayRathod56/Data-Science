import matplotlib.pyplot as plt
import numpy as np
students = ["Jay","Shakti","Ujwal"]
marks = [100,90, 34]
width = 0.4
plt.bar(students,marks,width, color='red')
plt.title('~~~ Students Marks ~~~~')
plt.xlabel("Students")
plt.ylabel("Marks")
plt.show()
