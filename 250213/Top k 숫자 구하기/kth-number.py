n, k = map(int, input().split())
nums = list(map(int, input().split()))

# Write your code here!
print(sorted(nums)[k - 1])