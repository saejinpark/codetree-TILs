answer = 0

N, M, D, S = map(int, input().split())


eat_log = [{}] + [{} for i in range(N)]
pain_log = []

for _ in range(D):
    p, m, t = map(int, input().split())

    if m in eat_log[p]:
        eat_log[p][m] = min(eat_log[p][m], t)
    else:
        eat_log[p][m] = t

for _ in range(S):
    pain_log.append(tuple(map(int, input().split())))

for i in range(1, m + 1):
    test_case = True

    for (p, t) in pain_log:

        if not test_case:
            break
        
        if i in eat_log[p] and eat_log[p][i] >= t:
            test_case = False
        
        if not test_case:
            break
    

    if test_case:

        stack = 0

        for person in eat_log:
            if i in person:
                stack += 1
    
        answer = max(answer, stack)

print(answer)



