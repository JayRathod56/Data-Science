
# Import the necessary packages and modules
import matplotlib.pyplot as plt
import numpy as np

# Prepare the data
x = np.linspace(0, 10, 100)
y=x**2

# Plot the data
plt.plot(x, y, label='Square linear')

# Add a legend
plt.legend()

# Show the plot
plt.show()







import matplotlib.pyplot as plt
import numpy as np

#plt.figure(figsize=(width,height))
plt.figure(figsize=(10,5))

#plt.plot([x-axis labels],[y-axis label]),
#The default format is b- which means a solid blue line
#plt.plot([1,2,3,4],[1,4,9,16])

#  'go': green circles. '^': Triangles. 'r^': red triangles
plt.plot([1,2,3,4],[1,4,9,16],'go')

plt.title("Sample Plot" )
plt.xlabel("x-axis")
plt.ylabel("y-axis")

plt.show()







###### WITHOUT FIGURE ########
import matplotlib.pyplot as plt
plt.plot([1, 2, 3, 4], [10, 20, 25, 30], color='lightblue', linewidth=3)
plt.scatter([0.3, 3.8, 1.2, 2.5], [11, 25, 9, 26], color='darkgreen', marker='^')
# marker means shape
plt.xlim(0.1,5.5)
plt.show()






# Import the necessary packages and modules
import matplotlib.pyplot as plt
import numpy as np

# Create a Figure
fig = plt.figure()

# Set up Axes
#111 is equal to 1,1,1, which means that you actually give three arguments to add_subplot().
#The three arguments designate the number of rows (1),
#the number of columns (1) and the plot number (1).
#So you actually make one subplot.
#ax = fig.add_subplot(111)
ax = fig.add_subplot(2,2,2) # 2 rows, 2 cols, plot 2

# Scatter the data
ax.scatter(np.linspace(0, 1, 5), np.linspace(0, 5, 5))
plt.title("scatter plot")

# Show the plot
plt.show()




