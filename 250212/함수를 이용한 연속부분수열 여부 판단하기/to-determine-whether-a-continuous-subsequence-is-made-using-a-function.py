n1, n2 = map(int, input().split())
a = list(map(int, input().split()))
b = list(map(int, input().split()))

# Write your code here!

test_case = False

for i in range(len(a) - len(b) + 1):

    if test_case:
        break

    if a[i:i + len(b)] == b:
        test_case = True
    
print("Yes" if test_case else "No")