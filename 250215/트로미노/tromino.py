n, m = map(int, input().split())
grid = [list(map(int, input().split())) for _ in range(n)]

# Write your code here!
def max_shape_one():

    start_coords = []
    cnts = []

    for r in range(n - 1):
        for c in range(n - 1):
            start_coords.append((r, c))

    for (r, c) in start_coords:
        sum_num = 0
        
        for i in range(r, r + 2):
            for j in range(c, c + 2):
                sum_num += grid[i][j]

        for i in range(r, r + 2):
            for j in range(c, c + 2):
                cnts.append(sum_num - grid[i][j])

    return max(cnts)

def max_shape_two():

    start_coords = []
    cnts = []

    for i in range(n):
        for j in range(n - 2):
            cnt = grid[i][j] + grid[i][j + 1] + grid[i][j + 2]
            cnts.append(cnt)
    
    for i in range(n - 2):
        for j in range(n):
            cnt = grid[i][j] + grid[i + 1][j] + grid[i + 2][j]
            cnts.append(cnt)

    return max(cnts)


print(max(max_shape_one(), max_shape_two()))

