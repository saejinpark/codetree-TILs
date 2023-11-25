import Foundation

let money = Int(readLine()!)!

print(
    money >= 3000 ? "book"
    : money >= 1000 ? "mask"
    : "no"
)