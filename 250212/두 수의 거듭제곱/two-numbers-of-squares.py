a, b = map(int, input().split())

# Write your code here!

answer = 1

for i in range(b):
    answer *= a

print(answer)