from typing import Any, List
import time
from copy import deepcopy

# Function
def add(a:int,b:int) -> int:
    return a + b

print("initate function",add(5,3))

# Let's create a decorator
def timeit(func):
    def wrapper(*args):
        start_time = time.time()
        func(*args)
        print("time took: ",time.time() - start_time)
    return wrapper

@timeit
def printer(x:Any):
    print(x)

printer("Hello Coders")

# lambda functions
caller = lambda x: printer(x)
caller([1,2,3,4,5])

# conditional statements
resp = True if 5 == '5' else False # True is returned if IF statement is True

# In python, there is no such thing called pass by value and pass by reference. it is pass by object
# Since int, float, string, tuple are immutables they act as pass by value and dict, list are mutable they act like pass by reference

# Scopes of variables

# Scenario 1
fruits = ["apple","kiwi","avacado"]
def append_fruit():
    # first fruits tries to get resolved in function scope. if not based on trace stack it will look at
    # next top-level
    fruits.append("grapes")

append_fruit()
print("fruits",fruits)

# Scenario 2
veggies = ["potato","tomato","lettuce"]
def append_veggie(veggies):
    veggies = deepcopy(veggies) # make a local copy of the variable with same name
    veggies.append("brocolli") # this is not global veggies
    def append_spices():
        veggies.append("chilli") # since veggies is not found here, use veggies from append_veggie
    append_spices()

append_veggie(veggies) # global variable is passed here
print("veggies",veggies)

# Scenario 3
veggies = ["potato","tomato","lettuce"]
def append_veggie():
    global veggies # if global is not used, below assignment will throw error
    veggies = deepcopy(veggies) # this actually changes veggies in globally not locally. removing this line produces same output. this is only done for explanation purpose
    veggies.append("brocolli") # so, added veggie to global
    def append_spices():
        veggies.append("chilli") # since veggies is not found here, use veggies from append_veggies which is global
    append_spices()

append_veggie()
print("veggies",veggies)

# recap for scopes: if it is just reference, variable will be automatically retrieved based on scope.
# But for assignment, scope must be explicitly defined, use global to use global variable. otherwise
# define the variable