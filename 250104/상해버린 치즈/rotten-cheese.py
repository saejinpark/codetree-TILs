answer = 0

n, m, d, s = map(int, input().split())

eat_log = []
pain_log = []

for _ in range(d):
    eat_log.append(tuple(map(int, input().split())))

for _ in range(s):
    pain_log.append(tuple(map(int, input().split())))

for i in range(1, m + 1):
    test_case = True

    for (p, t) in pain_log:

        if not test_case:
            break
        
        for (_p, m, _t) in eat_log:

            if p == _p and m == i and _t >= t:
                test_case = False
            
            if not test_case:
                break
    

    if test_case:
        eat_p_dict = {}

        for (p, _m, t) in eat_log:
            if _m == i:
                eat_p_dict[p] = True
    
        answer = max(answer, len(eat_p_dict.keys()))

print(answer)



