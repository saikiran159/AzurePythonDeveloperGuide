# Let's Start with python data types

"""
# Let's Start with Immutables

1. Number (int,float)
2. String
3. Boolean (True/False)
4. Tuple
5. FrozenSet
6. Bytes
"""

# Numbers
addition = 5 + 6
subtraction = 10 - 1
division = 5 / 2 # result will be float
floor_division = 5 // 2 # result is integer (discarding decimal points)
reminder_of_division = 5 % 2 # result is the reminder of the division operation
multiplication = 10 * 4
power = 2 ** 5 # equals to 2^5 in calculator
and_op_result = 2 & 5 # binary operation. 2 (0010) and 5 (0101). i haven't used this in my 3 years of my career
round_off = round(1.356247964,3) # rounds the decimal number to 3 decimals after dot discarding others
absolute_val = abs(-20) # converts to positive numbers

# String (Quite Exhaustive)
text = "my name is SaiKiran"
print("isupper", text[0].isupper()) # we can check if a char in above string is upper or lower case
print("islpha", "757abha".isalpha()) # we can check if a string/char is a alphabet or not
print("isalphanumeric","757abha".isalnum()) # we can check if a string is alphanumeric or not
print("isnumeric","123".isnumeric())
print("convert case",text.upper()) # we can convert the entire string to upper/lower
print("we can swap case too",text.swapcase())
print("create title",text.title()) # we can capitalize a text
print("Replace", "Policeman".replace("l","1").replace("o","0")) # replace characters in a string using replace function chaining
replace_table = str.maketrans({"l":"1","o":"0"}) # above chaining doesn't look good. this is an alternative method
print("replace","Policeman".translate(replace_table)) # but there is a catch, we can only replace single characters
print("padding", "human".center(10,"*")) # adds padding
print("left padding", "human".rjust(10,"*"))
print("split (method one)","name:age:gender".split(":"))
print("split (method two)","iloveyoumylove".partition("love"))
print("splitter","azure:google:salesforce:aws".rsplit(":",2)) # this only splits last two items. rest of string is returned as is
print("line splitter","hello\nmy name is python 3.7\nplease ask memory brother to store this information".splitlines())
print("search", "welcomeazure".find("sai")) # search for a part of a string. if not found this will return -1
print("search","welcomehomesweethome".find("home")) # if found, will return start index
print("search","welcomehomesweethome".rfind("home")) # does same as above, but first first match from last
print("join",",".join(["azure","gcp","aws"]))
print("counter","usa is a tech-savvy country. usa is a country with lots of guns".count("usa"))
print("prefix","files/notes.txt".removeprefix("files/"),"files/notes.txt".startswith("files/"))
print("suffix","files/notes.txt".removesuffix(".txt"),"files/notes.txt".endswith(".txt"))
print("convert to binary","Hello world 🌐".encode("utf-8")) # encodes string to binary format
print("format string part1","{0} is {1} language".format("python","programming")) # format string
print("format string part2","{language} developers are {desc}".format(language="C#",desc="Code Inflation Engineers"))
lang1,lang2 = "Python","C#"
print("format string part3",f"{lang1} is loved by all developers and people hate {lang2}")
print("remove spaces","           i got a cake that has size of vatican city  ".strip())

# Tuple
items = ("fidget","car","bike")
print("find",items.index("car")) # will throw error if not found
print("count",items.count("bus"))

# Binary
b_data = bytes("my name is pandas 🐻‍❄️","utf-8")
print("decode bytes",b_data.decode("utf-8"))

# FrozenSet
collection_one = frozenset((1,2,3,4,5))
collection_two = frozenset((4,5,6,7,8))
print("union",collection_one.union(collection_two))
print("intersection",collection_two.intersection(collection_one))
print("difference",collection_one.difference(collection_two))
print("symmetric diff",collection_one.symmetric_difference(collection_two))
print("disjoint",collection_two.isdisjoint(collection_one))
print("superset",collection_one.issuperset(collection_two))


