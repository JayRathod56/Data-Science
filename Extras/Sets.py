def setFunctions():
    # Creating Sets
    basket = {'apple', 'orange', 'apple', 'pear', 'orange', 'banana','apple'}
    quantity = {200,30,10,15,60,100}
    rate = {'dollar',10,"Rs.",750}
    # converting list to sets
    vowel = set(['a','e','i','o','u']) #set(iterables), list, string, tuple, dict

    #Printing Sets
    print("Basket : ",basket)
    print("Quantity : ",quantity)
    print("Rate:",rate)
    print("Vowel : ",vowel)

    print("Length of Basket :",len(basket)) # repeated elements are not counted

    print("30 in quantity : ",30 in quantity)
    print("Elements in basket : ")
    for i in basket:
        print(i)

    #Methods
    basket.add("pineapple")
    print(basket)

    quantity.update(rate)
    print("quantity.update(rate): ",quantity)

    price = rate.copy()
    print("Copy of Rate: ",price)

    # Set Operations
    set1 = {1,2,3,4,5}
    set2 = {1,2,3,4,5,6,7,8,9}
    print("SET 1:",set1)
    print("SET 2:",set2)
    print("Diffterence set2 and set1 : ",set2.difference(set1))
    #print("difference_update() set 2 and set 1: ",set2.difference_update(set1))
    set2.discard(9)
    print("Discard 9 from set 2: ",set2)
    inter = set2.intersection(set1)
    print("Intersection seet1 and set2 :",inter)
    print("isdisjoint() set 1 and set 2 : ",set1.isdisjoint(set2))
    print("issubset() set1 and set2 :",set1.issubset(set2))
    print("issuperset() set1 and set2 :",set2.issuperset(set1))
    print("set1|set2 : ",set1|set2)

setFunctions()