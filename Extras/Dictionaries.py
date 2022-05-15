# Dictionary are key and value pair
# {key:value}

# key should be unique

# zip() you will know why to use see the below program

keys = ["BOM","DEL","STN"]
values = ["Mumbai Airport","Delhi International","London Airport"]

dictionary = dict(zip(keys,values))
print(dictionary)
print()

#Normal way of creating a Dictionary

def createDict():
    #{key:value, key:value}
    cityDist = {"Mumbai" : 0, "Baroda" : 600, "Chinnai" : 1300, "Banglore" : 1400}
    print(cityDist,"\n")

    #we can use for loop also

    #for printing keys
    for keys in cityDist:
        print(keys)

    print()
    
    #printing values
    for values in cityDist.values():
        print(values)

    print()

    #printing both
    for items in cityDist.items():
        print(items)


# using fromkeys(keys , values)

print()

dictionary1 = dict.fromkeys(keys, values)
print("dict.fromkeys(keys, values): ",dictionary1)

print()

dictonary2 = dict.fromkeys(zip(keys,values))
print("dict.fromkeys(zip(keys, values)): ",dictonary2)

# it makes keys and values are bydefault none

print()

# converting mililiter to litre
def convert_ml_to_Lit():

    dictionary_mil = {'milk' : 1.02, 'coffee': 2.5, 'bread' :1.5}

    #for loop for printing dictionary keys and values diffenetly but together
    for (key,val) in dictionary_mil.items():
        print("key : ",key)
        print("value : ", val)
        print()

def dict_comprehension():

# when we use loop to assign values it is called loop compreshion

    ml_to_l = 0.001

    dictionary_mil = {'milk' : 1.02, 'coffee': 2.5, 'bread' :1.5}

    dictionary_lit = {key : value*ml_to_l for (key, value) in dictionary_mil.items()}
    print(dictionary_lit)

dict_comprehension()

def if_condition():

    currency = {'Pound' : 0.091, 'Euro' : 0.11, 'Usd' : 0.12, 'Afghani' : 9.15}

    dict_if_strong = {k:v for (k,v) in currency.items() if v>1}
    dict_if_weak = {k:v for (k,v) in currency.items() if v<1}
    print(dict_if_strong)
    print(dict_if_weak)

    print()

    dict_very_weak = {k:v for (k,v) in currency.items() if v>0.0 if v<0.1}
    print(dict_very_weak)

    print()

    dict_if_else = {k:('weak' if v>1 else 'strong') for (k,v) in currency.items()}
    print(dict_if_else)

if_condition()
