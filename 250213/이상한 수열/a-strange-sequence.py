N = int(input())

# Write your code here!
def solution(n):
    if n == 1:
        return 1
    if n == 2:
        return 2
    
    return solution(n // 3) + solution(n - 1)

print(solution(N))