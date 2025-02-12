n = int(input())

def test1(num):
    stack = 0
    temp = num

    while temp:
        stack += temp % 10
        temp = temp // 10
    
    return stack % 5 == 0

print("Yes" if test1(n) and n % 2 == 0 else "No")