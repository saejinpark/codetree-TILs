n = int(input())
name = []
height = []
weight = []

for _ in range(n):
    n_i, h_i, w_i = input().split()
    name.append(n_i)
    height.append(int(h_i))
    weight.append(int(w_i))

# Write your code here!

class Person:

    def __init__(self, name, height, weight):
        self.name = name
        self.height = height
        self.weight = weight

    def __str__(self):
        return f"{self.name} {self.height} {self.weight}"


people = []

for i in range(n):
    people.append(Person(name[i], height[i], weight[i]))

people.sort(lambda x: x.height)

for person in people:
    print(person)