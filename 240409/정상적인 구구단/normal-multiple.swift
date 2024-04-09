import Foundation

let n = Int(readLine()!)!

var grid:[String] = []

for first in 1...n {
    var row:[String] = []
    for second in 1...n {
        row.append("\(first) * \(second) = \(first * second)")
    }
    grid.append(row.joined(separator: ", "))
}

let answer = grid.joined(separator: "\n")

print(answer)