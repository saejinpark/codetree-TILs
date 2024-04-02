import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U>(value: T, function: (T) -> U) -> U {
    return function(value)
}

let n = Int(readLine()!)!

var grid = Array(repeating: Array(repeating: " ", count: n), count: n)

for row in 0..<n {
    for col in 0..<n {
        if row == 0 {
            grid[row][col] = "*"
            continue
        }
        if col % 2 == 1 &&  row <= col {
            grid[row][col] = "*"
        }

    }
}

var answer = ""

for row in grid {
    answer += row.joined(separator: " ") + "\n"
}

print(answer)