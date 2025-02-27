class Shape:
    def __init__(self,type): # we will define the initial object parameters here. self is a must
        self.type = type
    
    def length(self):
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
print(rect1.type)
rect1.length(5,3)
rect1.area(5,3)

