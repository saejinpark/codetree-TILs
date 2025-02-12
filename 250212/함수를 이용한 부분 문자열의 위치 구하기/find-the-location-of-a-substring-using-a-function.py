text = input()
pattern = input()

answer = -1

for i in range(len(text) - len(pattern) + 1):
    if answer != -1:
        break
    if text[i: i + len(pattern)] == pattern:
        answer = i

print(answer)