class Shape:
    base_type = "flat" # class attribute. this is global to class
    def __init__(self,type): # we will define the initial object parameters here. self is a must
        self.type = type
        self._color = "red" # protected varible
        self.__material = "plastic" # private variable
    
    def length(self): # method
        print("you need to implement this function")

    def area(self):
        print("you need to implement this function")


class Rectangle(Shape):
    def __init__(self, type):
        Shape.__init__(self,type)
    
    def length(self,w,h):
        print("perimeter length: ",2*(w+h))
    
    def area(self,w,h):
        print("area: ",w*h)

rect1 = Rectangle("rectangle")
print("class attribute: ",rect1.base_type)
print(rect1.type)
rect1.length(5,3)
rect1.area(5,3)

Shape.base_type = "long flat base" # changed global class variable

rect2 = Rectangle("rectangle")
print("class attribute: ",rect2.base_type) # change is reflected in object
print(rect2.type)
rect2.length(3,3)
rect2.area(3,3)
print("color: ",rect2._color)

# Let's look at pillars of OOPS
# Inheritance: get capabilities of another class
class Parent:
    def __init__(self,name):
        self.parent_name = name
    def get_name(self):
        return self.parent_name

class Child(Parent):
    def __init__(self, parent_name,your_name):
        super().__init__(parent_name) # set parent class
        self.name = your_name # set child object
    def get_your_details(self):
        print(f"my parent name is: {super().get_name()}.\nmy name is: {self.name}")

child_obj = Child("howard stark","tony stark")
child_obj.get_your_details()

# Abstraction: like a blueprint on how a class should be
from abc import ABC,abstractmethod

class FileHandler(ABC):
    @abstractmethod
    def read_file(self,file_path):
        pass
    
    @abstractmethod
    def update_file(self,file_path,content):
        pass

    @abstractmethod
    def create_file(self,file_path,content):
        pass

class TextFile(FileHandler):
    def read_file(self, file_path):
        with open(file_path,"r") as readResult:
            content = readResult.readlines()
        print("file content: ",content)
    
    def update_file(self, file_path, content):
        with open(file_path,"a") as writer:
            writer.write(content + "\n")

    def create_file(self, file_path, content):
        with open(file_path,"w") as writer:
            writer.write(content + "\n")

import json

class JsonFile(FileHandler):
    def read_file(self, file_path):
        with open(file_path,"r") as readResult:
            content = json.load(readResult)
        print("file content: ",content)
    
    def update_file(self, file_path,key,content):
        with open(file_path,"r") as readResult:
            json_content = json.load(readResult)
        
        json_content[key] = content
        
        with open(file_path,"w") as writer:
            json.dump(json_content,writer,indent=4)

    def create_file(self, file_path, content):
        with open(file_path,"w") as writer:
            json.dump(content,writer,indent=4)

# polymorphism: this is a slight extension to abstraction. this wants us to make sure parent class is replaced with child classes