n = int(input())
arr = list(map(int, input().split()))


answer = []

# Write your code here!
for i in range(0, len(arr), 2):
    sorted_arr = sorted(arr[:i + 1])
    answer.append(sorted_arr[i // 2])

print(" ".join(map(str, answer)))

