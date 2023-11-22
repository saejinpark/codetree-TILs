import Foundation

let input = readLine()!

let a = input.split(separator: " ").map{i in Int(i)!}.reduce(0, +)

print(a)