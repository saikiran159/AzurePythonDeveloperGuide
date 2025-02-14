from typing import Any
import time

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