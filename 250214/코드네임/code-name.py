MAX_N = 5

codenames = []
scores = []

for _ in range(MAX_N):
    codename, score = input().split()
    codenames.append(codename)
    scores.append(int(score))

# Write your code here!
arr = []

for i in range(MAX_N):
    arr.append((codenames[i], scores[i]))

arr = sorted(arr, key=lambda x: x[1])

print(arr[0][0], arr[0][1])