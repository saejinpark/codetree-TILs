n = int(input())
nums = list(map(int, input().split()))

# Write your code here!
grouped = list(map(sum, zip(nums[::2], nums[1::2])))

print(max(grouped))