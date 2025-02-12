y = int(input())

# Write your code here!

def is_leap_year(year):
    if year % 100 == 0 and year % 400 != 0:
        return False

    if year % 4 != 0:
        return False

    return True

print("true" if is_leap_year(y) else "false")
