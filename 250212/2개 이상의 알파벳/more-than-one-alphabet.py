from collections import defaultdict

A = input()
num_group = defaultdict(int)

# Write your code here!
for i in A:
    num_group[i] += 1

print("Yes" if len(num_group.keys()) >= 2 else "No")