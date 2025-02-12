n, m = map(int, input().split())

# Write your code here!

def gcd(w, h):
    if h > w:
        return gcd(h, w)

    if w % h == 0:
        return h
    else:
        return gcd(h, w % h)

print(gcd(n, m))