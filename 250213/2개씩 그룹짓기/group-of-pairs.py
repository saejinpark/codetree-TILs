n = int(input())
nums = list(map(int, input().split()))

# Write your code here!
nums.sort()

answer = 0

for i in range(len(nums) // 2):
    answer = max(answer, nums[i] + nums[len(nums) - 1 -i])

print(answer)