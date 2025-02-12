n = int(input())
A = list(map(int, input().split()))
B = list(map(int, input().split()))

# Write your code here!
print("Yes" if len(set(A) - set(B)) == 0 else "No")