import math

N = int(input())

# Write your code here!

print( sum(map(lambda x: int(math.pow(int(x), 2)), list(str(N))) ))