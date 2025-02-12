N = int(input())

# Write your code here!

def solution_left(n):
    if n > 1:
        return f"{n} {solution_left(n - 1)}"
    else:
        return "1"

def solution_right(n):
    if n > 1:
        return f"{solution_right(n - 1)} {n}"
    else:
        return "1"


def solution(n):
    return f"{solution_left(n)} {solution_right(n)}"

print(solution(N))
