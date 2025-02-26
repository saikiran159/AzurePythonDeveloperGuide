# map: map takes a function and a collection. each item in collection does to function and result is yielded. the result is a generator
items = [1,2,3,4,5,6,7,8]
map_result = map(lambda x:x**2,items)
print("map result",list(map_result))

# filter is also kind of same as map. here, function should return boolean to filter items in collection.
filter_result = filter(lambda x:x < 5,items)
print("filter result",list(filter_result))

# zip as the name says, it will zip the values based on index that are passed through zip function.
keys,values = ["name","age","gender"],["Mark",45,"Male"]
zip_result = zip(keys,values)
print("zip result",dict(zip_result)) # we can also convert to list of tuples

# comprehensions

# First lets start with list. if we want to write nested loops in single line with a final result, we can use comprehensions
list_comp = [i*j for i in range(3) for j in range(3,6)]
print("list comp result",list_comp)

# set comprehensions
set_result = {(x, y) for x in range(3) for y in range(3) if x != y}
print("set comp result",set_result)

# dict comprehensions
table = {'a': 1, 'b': 2, 'c': 3}
swapped_table = {v: k for k, v in table.items()}
print("dict comp result",swapped_table)