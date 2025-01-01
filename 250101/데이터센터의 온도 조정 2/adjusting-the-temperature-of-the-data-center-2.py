def solution(c, g, h, tmps, limit):
    answer = 0

    for tmp in range(0, limit + 1):
        work = 0
        for (t_a, t_b) in tmps:
            if tmp < t_a:
                work += c

            elif t_a <= tmp <= t_b:
                work += g

            else:
                work += h
        answer = max(answer, work)
    
    return answer


if __name__ == "__main__":
    import sys

    input = sys.stdin.readline
    n, c, g, h = map(int, input().split())

    tmps = []

    limit = -1

    for _ in range(n):

        t_a, t_b = map(int, input().split())

        limit = max(limit, t_b)

        tmps.append((t_a, t_b))

    print(solution(c, g, h, tmps, limit))