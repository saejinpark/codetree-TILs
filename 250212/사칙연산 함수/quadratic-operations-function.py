a, o, c = input().split()
a = int(a)
c = int(c)

# Write your code here!

if o not in ["+", "-", "/", "*"]:
    print("False")

else:
    if o == "+":
        print(a, o, c, "=", a + c)
    elif o == "-":
        print(a, o, c, "=", a - c)
    elif o == "/":
        print(a, o, c, "=", a // c)
    else:
        print(a, o, c, "=", a * c)