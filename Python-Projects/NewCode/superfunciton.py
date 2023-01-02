class Person:
    def __init__ (self , fname , sname):
        self.firstname = fname 
        self.secondname = sname 

    def helloworld(self):
        print("Hello My Name is " + self.firstname + " " + self.secondname)

class Child(Person):
    def __init__ (self , fname , sname , date):
        Person.__init__ (self , fname , sname)
        self.FIRSTNAME = fname
        self.SECONDNAME = sname
        self.DATE = date

    def printshit(self):
        print("Hello My Name is " + self.FIRSTNAME + " " + self.SECONDNAME + "and I am " + self.DATE)
x = input("Enter your First Name :")
y = input("Enter your Second Name :")
object = Person(x,y)
object.helloworld()
z = "18"
childclass = Child(x,y,z)
childclass.printshit()
