x, y = map(int, input().split())

def cal_sum_pos(num):
    sum = 0

    temp = num

    while temp != 0:
        sum += temp % 10
        temp = temp // 10

    return sum

answer = 0

for num in range(x, y + 1):
    answer = max(answer, cal_sum_pos(num))


print(answer)