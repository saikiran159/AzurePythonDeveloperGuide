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
print("color: ",rect2.__material)

