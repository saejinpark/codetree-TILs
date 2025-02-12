N = int(input())

# Write your code here!
def fnc(n):
    if n in [1, 2]:
        return 1
    else:
        return fnc(n - 2) + fnc(n - 1)

print(fnc(N))
