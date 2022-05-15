# NumPy Array Slicing


#NumPy Array Slicing
## Syntax: [start:end].
## Syntax: [start:end:step].
## In end the digit is exclusive
## i.e arr[1:5]
## So it would print values from 1 to 4 
## Default start : 0, end: length of array, step :1

import numpy as np
arrP = np.array([1, 2, 3, 4, 5, 6, 7])
print(arrP[1:5])
print("~"*20)

#Negative Slicing
#Slice from the index 3 from the end to index 1 from the end:
arrN = np.array([1, 2, 3, 4, 5, 6, 7])
print(arrN[-3:-1])
print("~"*20)




