import math

a, b = map(int, input().split())

# Write your code here!

def is_prime(num):
    if num < 2:
        return False

    if num == 2:
        return True
    
    for i in range(2, int(math.sqrt(num)) + 1):
        if not num % i:
            return False
    
    return True

answer = 0

for i in range(a, b + 1):
    if is_prime(i):
        answer += i

print(answer)