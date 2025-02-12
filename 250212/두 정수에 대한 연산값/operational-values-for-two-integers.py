a, b = map(int, input().split())

# Write your code here!

def solution():
    global a, b
    
    if a > b:
        a += 25
        b *= 2
    else:
        a *= 2
        b += 25

solution()

print(a, b)