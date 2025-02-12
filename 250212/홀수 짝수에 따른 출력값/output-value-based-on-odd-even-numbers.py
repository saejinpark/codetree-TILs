N = int(input())

# Write your code here!

def solution(stack, n):
    if n < 0:
        return stack
    else:
        return solution(stack + n, n - 2)


print(solution(0, N))


