n = int(input())
arr = list(map(int, input().split()))

# Write your code here!

answer = map(lambda x: str(x // 2) if x % 2 == 0 else str(x), arr)

print(" ".join(answer))