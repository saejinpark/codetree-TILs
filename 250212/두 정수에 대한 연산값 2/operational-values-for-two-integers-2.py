a, b = map(int, input().split())

# Write your code here!
def solution():
    global a, b

    if a < b:
        a += 10
        b *= 2
    else:
        a *= 2
        b += 10

solution()

print(a, b)