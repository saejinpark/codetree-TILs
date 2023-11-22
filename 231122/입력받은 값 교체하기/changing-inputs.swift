import Foundation

let input = readLine()!.split(separator: " ")

var a = input.first!
var b = input.last!
var temp = a

a = b
b = temp

print("\(a) \(b)")