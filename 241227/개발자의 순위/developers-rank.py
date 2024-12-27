k, n = map(int, input().split())

matrix = []

for i in range(k):
    matrix.append(list(map(int, input().split())))

def list_to_pair_set(lst):
    result = set()

    for i in range(len(lst)):
        for j in range(i + 1, len(lst)):
            result.add((lst[i], lst[j]))
    
    return result

pair_set_matrix = list(map(list_to_pair_set, matrix))
intersection_pair = set.intersection(*pair_set_matrix)

print(len(intersection_pair))