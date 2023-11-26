import Foundation

let a = Int(readLine()!)!

print((a >= 3 && a % 3 == 0) || (a >= 5 && a % 5 == 0) ? 1 : 0)