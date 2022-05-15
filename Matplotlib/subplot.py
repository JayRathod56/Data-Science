# Import the necessary packages and modules
import matplotlib.pyplot as plt
import numpy as np

# Create a Figure
fig = plt.figure()
x = np.arange(1,5)
y = x**3

# plt.subplot(row,col,cell)
plt.subplot(2,1,1,)
plt.plot([1,2,3,4],[1,4,9,16],'r^')


plt.subplot(2,1,2)
plt.plot(x,y,'go')


plt.suptitle("~~~~~ Subplots ~~~~~")
# frame_on=False makes the border of graphs invisible

# How to add common x and y axis lable
fig.add_subplot(111, frame_on=False)
plt.tick_params(labelcolor="none", bottom=False, left=False)

plt.xlabel("X-Axis")
plt.ylabel("Y-Axis")
plt.show()


