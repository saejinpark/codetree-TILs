a, b = map(int, input().split())

# Write your code here!

def num_to_num_arr(num):
    return list(map(int, list(str(num))))

cnt = 0

for i in range(a, b + 1):
    num_arr = num_to_num_arr(i)
    if 3 in num_arr or 6 in num_arr or 9 in num_arr:
        cnt += 1
        continue
    if i % 3 == 0:
        cnt += 1

print(cnt)