import Foundation

var a = Int(readLine()!)!

if a % 2 == 1 {
    a = a + 3
}

if a >= 3 && a % 3 == 0 {
    a = a / 3
}

print(a)