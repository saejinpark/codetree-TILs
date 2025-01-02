from collections import Counter

def test(num):
    digits_str = str(num)

    c = Counter(digits_str)

    if len(c) != 2:
        return False

    return any(count == 1 for count in c.values())

if __name__ == "__main__":
    import sys

    input = sys.stdin.readline

    x, y = map(int, input().split())

    answer = 0

    for test_case in range(x, y + 1):
        if test(test_case):
            answer += 1
    
    print(answer)
