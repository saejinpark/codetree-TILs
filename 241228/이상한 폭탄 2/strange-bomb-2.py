n, k = map(int, input().split())

booms = []

for i in range(n):
    booms.append(int(input()))

answer = -1

for i in range(len(booms)):
    for j in range(i + 1, len(booms)):
        # 두 폭탄의 번호가 같고 거리 조건이 만족되면
        if booms[i] == booms[j] and abs(i - j) <= k:
            answer = max(answer, booms[i])

print(answer)