n = int(input())
name = []
street_address = []
region = []

for _ in range(n):
    n_i, s_i, r_i = input().split()
    name.append(n_i)
    street_address.append(s_i)
    region.append(r_i)

# Write your code here!
class person:
    
    def __init__(self, name, address, region):
        self.name = name
        self.address = address
        self.region = region

    def __str__(self):
        return f"name {self.name}\naddr {self.address}\ncity {self.region}"

people = []

for i in range(n):
    people.append(person(name[i], street_address[i], region[i]))

people.sort(lambda x: x.name, reverse=True)

print(people[0])