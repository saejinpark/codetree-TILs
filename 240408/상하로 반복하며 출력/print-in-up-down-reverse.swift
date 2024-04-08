import Foundation

let n = Int(readLine()!)!

var grid = Array(
    repeating: 
        Array(
            repeating: "",
            count: n
        ),
    count: n
)

for col in 0..<n {
    for row in 0..<n {
        grid[col % 2 == 0 ? row: n - (row + 1)][col] = String(row + 1)
    }
}

let answer = grid.map{
    $0.joined(separator: "")
}.joined(separator: "\n")

print(answer)