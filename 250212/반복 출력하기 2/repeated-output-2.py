n = int(input())

# Write your code here!

def fnc(cnt):
    print("HelloWorld")
    if cnt == 1:
        return
    else:
        fnc(cnt - 1)

fnc(n)