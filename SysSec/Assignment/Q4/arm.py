num = int(input("Enter a number: "))
sum = 0
a = num
while a > 0:
    digit = a%10
    sum += digit ** 3
    a //=10
if num == sum:
    print(num,"It is an Armstrong number")
else:
    print(num,"It is not a Armstrong number")
