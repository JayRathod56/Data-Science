# List as Queue

# Lists can also be used as Queue
# i.e FIFO (First In First Out)
# we can do this by importing dequeue from collections
# eg.   from collections import deque
#       queue = deque(["Eric", "John", "Michael"])
# but it is not recomended as these operations becomes slow
# because list usually works with LIFO

from collections import deque
def listQue():
    q1 = deque(["MVCEC", "MVLU", "Data", "Science"])
    l1 = [1,2,3]
    l2=[10,20,30]
    print("Printing q1: ",q1)
    # prints q1 with deque and square brackets with comma
    q1.append("Mahi")
    print("q1.apend('Mahi'): ",q1)
    q1.appendleft("Aashish")
    print("q1.apendleft('Aashish'): ",q1)
    q1.extend(l1)
    print("q1.extent(l1): ",q1)
    q1.extendleft(l2)
    print("q1.extendleft('l2'): ",q1)
    print("q1.pop(): ",q1.pop())
    print("Printing q1: ",q1)
    print("q1.popleft(): ",q1.popleft())
    print("Printing q1: ",q1)
    q1.rotate(-1)
    print("q1.rotate(-1): ",q1)
    q1.rotate(-2)
    print("q1.rotate(-2): ",q1)
    q2 = deque([1,2,3,4,5,6])
    s =0
    for i in q2:
        s = s + i
    print("Sum of elements in l1 : ",s)


listQue()

# Queue Class

from queue import Queue   # from library import Class
def que():
    q = Queue(3)    # q is an object of class Queue; Queque() is a constructor of class Queue
    print(q)
    print("~"*20)
    print("Size : ",q.qsize())
    print("Empty ? : ",q.empty())
    print("Full ? : ",q.full())
    print("~"*20)
    q.put(20)
    print("q.put(20)")
    print("Size : ",q.qsize())
    print("Empty ? : ",q.empty())
    print("Full ? : ",q.full())
    print("~"*20)
    
    q.put(30)
    print("q.put(30)")
    print("Size : ",q.qsize())
    print("Empty ? : ",q.empty())
    print("Full ? : ",q.full())
    print("~"*20)

    q.put(50)
    print("q.put(50)")
    print("Size : ",q.qsize())
    print("Empty ? : ",q.empty())
    print("Full ? : ",q.full())
    print("~"*20)

    #q.put(100,block=False)
    print(q.get())
    print("q.get()")
    print("Size : ",q.qsize())
    print("Empty ? : ",q.empty())
    print("Full ? : ",q.full())
    print("~"*20)

    print(q.get())
    print("q.get()")
    print("Size : ",q.qsize())
    print("Empty ? : ",q.empty())
    print("Full ? : ",q.full())
    print("~"*20)

    print(q.get())
    print("q.get()")
    print("Size : ",q.qsize())
    print("Empty ? : ",q.empty())
    print("Full ? : ",q.full())
    print("~"*20)
que()
    
