n = int(input())

# Write your code here!

def print_star(num):
    if num:
        print_star(num - 1)
    else:
        return
    print("*" * num)

print_star(n)