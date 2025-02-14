product_name, product_code = input().split()
product_code = int(product_code)

# Write your code here!

class product:
    def __init__(self, name = "codetree", code = 50):
        self.name = name
        self.code = code

    def redefine(self, name, code):
        self.name = name
        self.code = code
    
    def __str__(self):
        return f"product {self.code} is {self.name}"


product1 = product()
print(product1)
product1.redefine(product_name, product_code)
print(product1)