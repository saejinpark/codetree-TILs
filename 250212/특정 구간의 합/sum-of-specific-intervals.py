n, m = map(int, input().split())
arr = list(map(int, input().split()))
queries = [tuple(map(int, input().split())) for _ in range(m)]

# Write your code here!
for (s, e) in queries:
    print(sum(arr[s - 1:e]))
