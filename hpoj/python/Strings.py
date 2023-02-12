a = "Hello, world!"
a.lstrip()
print(a[2:8])
print(a.split("\n"))
x = "Hello" in a
print(x)
txt = "For only {price:.2f} dollars!"
txt = txt.format(price = 49)
print(txt.endswith('dollars!'))
print(txt)