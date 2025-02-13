n, k, t = input().split()
n, k = int(n), int(k)
str = [input() for _ in range(n)]

# Write your code here!
print(sorted(list(filter(lambda x: x.startswith(t), str)))[k - 1])