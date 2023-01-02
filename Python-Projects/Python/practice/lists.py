#Lists
#############################################################
#
# list = ["knightfall", 'is' , "awesome" , 'and' , 'cool']
# print(list[1])
# print(list[0:3])
# if 'is' in list:
#     print("True")
# print(len(list))
# x = input("Enter the word to be inserted to the list:")
# list.append(x)
# print(list)
# list.remove("hello")
# print(list)
# print(list.pop(3))
# print(list)
# list.insert(3 , "and")
# print(list)
# list.clear()
# print(list)
#
#############################################################
#Tuple
# x = ("knightfall" , 'is' , 'awesome')
# print(x)
# y = list(x)
# y[1]="Suganth"
# x = tuple(y)
# print(x)
# print(x.count("Suganth"))
#############################################################
#SET
# set = {"knightfall" , "is" , "Awesome" , "and" , "cool"}
# set1 = { "hello" , "are" , "you" , "knightfall"} 
# print(set)
# set.add("okay")
# print(set)
# set.update(["never" , "sorry" , "here"])
# print(set)
# print(set.union(set1))
# print(set.update(set1))
# print(set.symmetric_difference(set1))
# print(set.intersection(set1))
#############################################################
#Dictionaries
Amrita = {
        "CollegeName" : "Amrita",
        "Department" : "CYS",
        "Name" : "knightfall"
        }

print(Amrita["Name"])
print(len(Amrita))
for x in Amrita:
    print(x)
for x in Amrita:
    print(Amrita[x])
for x in Amrita.values():
    print(x)
for x , y in Amrita.items():
    print(x,y)
print(Amrita)
Amrita.popitem()
print(Amrita)
#############################################################


