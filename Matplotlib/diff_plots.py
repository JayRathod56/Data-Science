# Import `pyplot` from `matplotlib`
import matplotlib.pyplot as plt
import numpy as np

# Initialize the plot
fig = plt.figure()
ax1 = fig.add_subplot(131)
ax2 = fig.add_subplot(132)
ax3 = fig.add_subplot(133)

# Set up Axes
#111 is equal to 1,1,1, which means that you actually give three arguments to add_subplot().
#The three arguments designate the number of rows (1),
#the number of columns (1) and the plot number (1).
#So you actually make one subplot.
#ax = fig.add_subplot(111)

# Plot the data
ax1.bar([1,2,3],[3,4,5])
ax2.barh([0.5,1.5,2.5],[0.5,1,2],0.4,color="red")
# ax2.axhline(0.45,color="red" )
# ax1.axvline(0.65)
ax3.scatter(np.linspace(0, 1, 5), np.linspace(0, 5, 5))
# np.linespace(x,y,z)
# where x and y are upper and lower bounds and z is number of elements in the array
# eg. np.linspace(0,1,5)
# will give 5 elements having value between 0 and 1

# Show the plot
plt.show()
