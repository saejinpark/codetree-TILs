import Foundation

let n = Int(readLine()!)!

print(stride(from: n, to: 0, by: -1).map{String($0)}.joined(separator: " "))