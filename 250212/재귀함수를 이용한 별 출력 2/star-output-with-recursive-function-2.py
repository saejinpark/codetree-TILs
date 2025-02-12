n = int(input())

# Write your code here!

def solution_top(cnt):
    if cnt == 1:
        return "*"
    
    return f"{' '.join(['*'] * cnt)}\n{solution_top(cnt - 1)}"

def solution_bottom(cnt):
    if cnt == 1:
        return "*"
    
    return f"{solution_bottom(cnt - 1)}\n{' '.join(['*'] * cnt)}"

def solution(cnt):
    print(f"{solution_top(cnt)}\n{solution_bottom(cnt)}")

solution(n)