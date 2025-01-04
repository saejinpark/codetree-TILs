answer = 0

n, m, d, s = map(int, input().split())

eat_log = []
pain_log = []

for _ in range(d):
    p, m, t = map(int, input().split())
    eat_log.append((p, m, t))

for _ in range(s):
    p, t = map(int, input().split())
    pain_log.append((p, t))

for i in range(1, m + 1):
    test_case = True

    for (p, t) in pain_log:

        if not test_case:
            break
        
        for (_p, m, _t) in eat_log:

            if p == _p and m == i and _t - 1 >= t:
                test_case = False
            
            if not test_case:
                break

    if test_case:
        filtered_eat_log = list(filter(lambda x : x[1] == i, eat_log))
    
        answer = max(answer, len(filtered_eat_log))

print(answer)



