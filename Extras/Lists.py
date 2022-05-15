# List Operations
num = [1,2,3,5,6]
alpha = [2, 'even', 3.0 , 'odd',2,'even']

print("~"*50)
print("List num : ",num)
print("List alpha : ",alpha)
print("~"*50)
# Prints list with square brackets and commas

num.append(7)
print("num.append(7) : ",num)
# Appends 7 to the end of the list num

num.extend(alpha)
print("num.extend(alpha) : ",num)
# Extends the list num by appending elements of list alpha

num.append(alpha)
print("num.append(alpha) : ",num)
# Appends whole list of alpha to num (with square brackets)

indx2 = alpha.index('even',2)
print("alpha.index('even',2) : ",indx2)
# Prints the index position of even starting from index position 2 

alpha.insert(3,4)
print("alpha.insert(3,4) : ",alpha)
# Inserts 4 at the position of 3

alpha.remove(4)
print("alpha.remove(4) : ",alpha)
# Removes first occurance of 4 from list alpha

alpha.remove(2)
print("alpha.remove(2) : ",alpha)
# Removes first occurance of 2 from list aplha

num.remove(alpha)
print("num.remove(alpha) : ",num)
# Removes the whole list named alpha from num

print("num : ",num)
print("num.pop() : ",num.pop())
# prints the element that is popped


# List can be used as Stack
# i.e LIFO (Last In First Out)
# using append as push
# and pop as pop

# Lists can also be used as Queue
# i.e FIFO (First In First Out)
# we can do this by importing dequeue from collections
# eg.   from collections import deque
#       queue = deque(["Eric", "John", "Michael"])
# but it is not recomended as these operations becomes slow
# because list usually works with LIFO

# List Comphereshion
# Basically converting the program (using list) into a single line is called list comphereshion.
# eg. 
# >>> squares = []
# >>> for x in range(10):
# ...     squares.append(x**2)
# ...
# >>> squares
# [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

# squares = list(map(lambda x: x**2, range(10)))
# or, equivalently:

# squares = [x**2 for x in range(10)]
