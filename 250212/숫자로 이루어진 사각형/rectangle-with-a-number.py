n = int(input())

# Write your code here!

def gen_get_num():
    num = -1
    
    def get_num():
        nonlocal num
        num = (num + 1) % 9
        return num

    return get_num 

get_num = gen_get_num()

matrix = [[get_num() + 1 for _ in range(n)] for _ in range(n)]

for row in matrix:
    print(" ".join(map(str, row)))