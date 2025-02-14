n = int(input())
name = []
korean = []
english = []
math = []

scores = []

for _ in range(n):
    student_info = input().split()
    name.append(student_info[0])
    korean.append(int(student_info[1]))
    english.append(int(student_info[2]))
    math.append(int(student_info[3]))

# Write your code here!

class Score:

    def __init__(self, name, korean, english, math):
        self.name = name
        self.korean = korean
        self.english = english
        self.math = math

    def __str__(self):
        return f"{self.name} {self.korean} {self.english} {self.math}"

for i in range(n):
    scores.append(Score(name[i], korean[i], english[i], math[i]))

scores.sort(lambda x: (x.korean, x.english, x.math), reverse=True)

for score in scores:
    print(score)