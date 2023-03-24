def is_palindrome(n):
    str_n = str(n)
    return str_n == str_n[::-1]

num = int(input("Enter the number to check whether it is a palindrome :"))
if is_palindrome(num):
    print(f"{num} is a palindrome")
else:
    print(f"{num} is not a palindrome")

