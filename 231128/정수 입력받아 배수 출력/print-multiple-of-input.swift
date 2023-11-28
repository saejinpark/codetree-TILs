import Foundation

let n = Int(readLine()!)!

let text = (1...5).map { String($0 * n) }.joined(separator: " ")
print(text)