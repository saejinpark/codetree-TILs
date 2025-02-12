n = int(input())
arr = list(map(int, input().split()))

answer = map(lambda x: str(abs(x)), arr)

print(" ".join(answer))