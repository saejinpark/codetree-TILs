import Foundation

let a = Int(readLine()!)!

print((a >= 13 && a % 13 == 0) || (a >= 19 && a % 19 == 0) ? "True" : "False")