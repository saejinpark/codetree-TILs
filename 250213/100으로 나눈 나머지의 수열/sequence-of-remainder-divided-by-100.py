N = int(input())

# Write your code here!
def solution(n):
    if n == 1:
        return 2
    
    if n == 2:
        return 4

    return solution(n - 1) * solution(n - 2) % 100

print(solution(N))
