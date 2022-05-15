# NumPy Datatypes

# NumPy Datatypes
'''
i - integer
b - boolean
u - unsigned integer
f - float
c - complex float
m - timedelta
M - datetime
O - object
S - string
U - unicode string
V - fixed chunk of memory for other type ( void )
'''

import numpy as np
print("~"*20)
arr = np.array(['apple', 'banana', 'cherry'])
print(arr.dtype)
# This would print U6 
# means unicode string having size of 6 bytes.
print("~"*20)

#Create an array with data type string:
arrS = np.array([1, 2, 3, 4], dtype='S')
print(arrS)
print(arr.dtype)
print("~"*20)

#For i, u, f, S and U we can define size as well.
#Create an array with data type 4 bytes integer:
arr3 = np.array([1, 2, 3, 4], dtype='i4')
print(arr3)
print(arr3.dtype)
print("~"*20)

#A non integer string like 'a' can not be converted to integer (will raise an error):
##arr4 = np.array(['a', '2', '3'], dtype='i')

#Change data type from float to integer by using 'i' as parameter value:
arr5 = np.array([1.1, 2.1, 3.1])
newarr5 = arr5.astype('i')
print(newarr5)
print(newarr5.dtype)
print("~"*20)

#Change data type from integer to boolean: 0--> False else True
# i.e if the value is 0 the bool value is false and for any other values it is true
arr6 = np.array([1, 0, 3])
newarr6 = arr6.astype(bool)
print(newarr6)
print(newarr6.dtype)




