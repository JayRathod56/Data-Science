import matplotlib.pyplot as plt
import numpy as np

# Create a Figure
# fig = plt.figure()

#x and y values 
x = np.arange(1,5)
y = x**3

fig, ax = plt.subplots(nrows=2,ncols=2,figsize=(6,6))

ax[0,0].set_title("Linear")
ax[0,0].plot(x,x)

ax[0,1].plot([1,2,3,4],[1,4,9,16],'r^')
# r^ means red colour triangle
ax[0,1].set_title("Square of Numbers")

ax[1,1].plot(x,x**4)
ax[1,1].set_title("4th Power")

ax[1,0].plot(x,y,'go')
# go means green colour circle
ax[1,0].set_title("Cube of Numbers")


plt.show()
