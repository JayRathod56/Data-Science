
import numpy as np
# to create a very basic ndarray, you use the np.array() method.
arr = np.array([1,2,3,4])
arrs = np.array(["aap","edhar","i","o"])
print(arr)
print(type(arr))
print(arr.dtype)
print(arrs.dtype)
print("Dimension :",arr.ndim)
print("~"*20)

# 0-D array or we can say 1 element in the array.
arr0 = np.array([700])
print("0-D array : ",arr0)
print("Dimension :",arr0.ndim)
# It will print 1 dimentional

# 1-D array
print("~"*20)
arr1 = np.array([700,800,900])
print("1-D array : ",arr1)
print("Dimention :",arr1.ndim)

### 2-D array
print("~"*20)
arr2 = np.array([[700,800,900],[70,80,90]])
print("2-D array : ")
print(arr2)
print("Dimension :",arr2.ndim)

### 3-D array
print("~"*20)
arr3 = np.array([[[1, 2, 3], [4, 5, 6]], [[10, 20, 30], [40, 50, 60]]])
print("3-D array : ")
print(arr3)
print("Dimention :",arr3.ndim)

### Higher Dimention
print("~"*20)
print("Higher Dimension array : ")
arrH = np.array([1, 2, 3, 4], ndmin=5)
print(arrH)
print('Dimension :', arrH.ndim)

#Array of zeros
print("~"*20)
print("Zero array : ")
arryZero = np.zeros(5)
print(arryZero)

#an array of all 1s using the np.ones() method
print("~"*20)
print("One's array : ")
arryOnes = np.ones(5,dtype=np.int32)
print(arryOnes)


# an array with random values using np.random.rand() method,
#with random values from [0,1)
print("~"*20)
print("Random array : ")
arryRand = np.random.rand(2,3)   #rand(rows,col)
print(arryRand)

#Create an array filled with any given value using the np.full() method.
#Just pass in the shape (row, col) of the desired array and the value you want:
print("~"*20)
print("Choice array : ")
arryChoice = np.full((2,2),700)
# i.e it will create an 2x2 array having value 700
print(arryChoice)

#identity Matrix :  np.eye() that returns an array with 1s along its diagonal
#and 0s everywhere else.
print("~"*20)
print("identity Matrix : ")
arryIdentity = np.eye(4,k=0)
print(arryIdentity)

#Above Diagonal
print("Above Diagonal Matrix : ")
arryIdentityAbove= np.eye(4,k=2)
print(arryIdentityAbove)

#Below Diagnal
print("Below Diagnal Matrix : ")
arryIdentityBelow = np.eye(4,k=-2)
print(arryIdentityBelow)



