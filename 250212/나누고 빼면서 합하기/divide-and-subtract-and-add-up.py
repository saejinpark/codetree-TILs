n, m = map(int, input().split())
A = list(map(int, input().split()))

# Write your code here!
answer = 0

while m != 1:
    answer += A[m - 1]

    if m % 2:
        m -= 1
    else:
        m //= 2

answer += A[m - 1]

print(answer) 
