n = int(input())

# Write your code here!
def num_arr_pnt(cnt):
    if cnt == 1:
        return "1"
    else:
        return f"{num_arr_pnt(cnt - 1)} {cnt}"

def reverse_num_arr_pnt(cnt):
    if cnt == 1:
        return "1"
    else:
        return f"{cnt} {reverse_num_arr_pnt(cnt - 1)}"


print(num_arr_pnt(n))
print(reverse_num_arr_pnt(n))