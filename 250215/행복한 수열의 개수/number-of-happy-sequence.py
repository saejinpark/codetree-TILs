n, m = map(int, input().split())
grid = [list(map(int, input().split())) for _ in range(n)]
roll_grid = [[0 for _ in range(n) ] for _ in range(n)]

for r in range(n):
    for c in range(n):
        roll_grid[c][r] = grid[r][c]

# Write your code here!
def is_happy_secuence(row):
    temp = -1
    cnt = 0

    for i in row:
        if i == temp:
            cnt += 1
        elif temp == -1:
            temp = i
            cnt = 1
        else:
            temp = i
            cnt = 1
            
        
        if cnt == m:
            return True
    
    return False

answer = 0

for row in grid:
    if is_happy_secuence(row):
        answer += 1

for row in roll_grid:
    if is_happy_secuence(row):
        answer += 1

print(answer)
