n = int(input())

min_s = 101
max_e = -1

lines = []

for i in range(n):
    s, e = map(int, input().split())
    lines.append((s, e))
    min_s = min(min_s, s)
    max_e = max(max_e, e)

answer = 0

for i in range(n):
    for j in range(i + 1, n):
        for k in range(j + 1, n):
            idx_list = list(filter(lambda x: x != i and x != j and x != k, range(n)))
            visited = {}
            
            test_case = True

            for visite in range(min_s, max_e + 1):
                visited[visite] = False

            for idx in idx_list:
                s, e = lines[idx]

                if not test_case:
                    break

                for point in range(s, e + 1):
                    if not test_case:
                        break

                    if not visited[point]:
                        visited[point] = True
                    else:
                        test_case = False

            if test_case:
                answer += 1


print(answer)