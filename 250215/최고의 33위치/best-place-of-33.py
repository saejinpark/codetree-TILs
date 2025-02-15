n = int(input())
grid = [list(map(int, input().split())) for _ in range(n)]

# Write your code here!

def solution(start_row, start_col):
    stack = 0

    for r in range(start_row, start_row + 3):
        for c in range(start_col, start_col + 3):
            stack += grid[r][c]

    return stack

answer = -1

for start_row in range(n - 2):
    for start_col in range(n - 2):
        answer = max(answer, solution(start_row, start_col))

print(answer)