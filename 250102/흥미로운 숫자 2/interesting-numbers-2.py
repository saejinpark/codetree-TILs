






if __name__ == "__main__":

    import sys
    from collections import defaultdict

    input = sys.stdin.readline

    x, y = map(int, input().split())

    answer = 0

    for test_case in range(x, y + 1):

        visited = defaultdict(int)

        temp = test_case

        while temp != 0:
            num = temp % 10
            temp = temp // 10
            
            visited[num] += 1

        if len(visited) != 2:
            continue
        
        v_list = list(visited.values())

        if v_list[0] == 1 or v_list[1] == 1:
            answer += 1


    print(answer)
