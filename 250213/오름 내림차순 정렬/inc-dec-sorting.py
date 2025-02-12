n = int(input())
nums = list(map(int, input().split()))

# Write your code here!
print(" ".join(list(map(str, sorted(nums)))))
print(" ".join(list(map(str, sorted(nums, reverse=1) ))))