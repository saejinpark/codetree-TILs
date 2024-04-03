import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let n = Int(readLine()!)!
let lastIndex = n - 1

var grid = Array(repeating: Array(repeating: " ", count: n), count: n)


for rowIndex in 0..<grid.count {
    for colIndex in 0..<grid[rowIndex].count {
        if rowIndex == 0
        || rowIndex == lastIndex
        || colIndex == 0
        || colIndex == lastIndex {
            grid[rowIndex][colIndex] = "*"
            continue
        }
        grid[rowIndex][colIndex] = rowIndex - colIndex > 0  ? "*": " "
    }
}

let answer = grid.map{$0.joined(separator: " ")}.joined(separator: "\n")

print(answer)