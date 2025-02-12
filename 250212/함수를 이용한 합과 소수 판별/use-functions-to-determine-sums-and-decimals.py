import math

a, b = map(int, input().split())

# Write your code here!
def is_prime(num):
    if num < 2:
        return False
    if num == 2:
        return True

    for i in range(2, int(math.sqrt(num)) + 1):
        if num % i == 0:
            return False
        
    return True

def is_even_pos_num(num):
    stack = 0
    temp = num

    while temp:
        stack += temp % 10
        temp = temp // 10
    
    return stack % 2 == 0

cnt = 0

for i in range(a, b + 1):
    if is_prime(i) and is_even_pos_num(i):
        cnt += 1

print(cnt)


