n = int(input())

# Write your code here!

def three_n_plus_one(num, stack = 0):
    if num == 1:
        return stack
    
    if num % 2:
        return three_n_plus_one(num * 3 + 1, stack + 1)
    else:
        return three_n_plus_one(num // 2, stack + 1)

print(three_n_plus_one(n))