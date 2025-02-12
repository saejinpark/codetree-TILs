N = int(input())

# Write your code here!

cnt = 0

while N != 1:
    cnt += 1
    if N % 2 == 0:
        N //= 2
    else:
        N //= 3
print(cnt)