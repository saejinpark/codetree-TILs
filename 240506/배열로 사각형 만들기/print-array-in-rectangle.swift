import Foundation

var grid = Array(
                repeating:Array(repeating:0, count: 5),
                count:5
            )

for i in 0..<5 {
    grid[0][i] = 1
    grid[i][0] = 1
}

for i in 1..<5 {
    for j in 1..<5 {
        grid[i][j] = grid[i][j - 1] + grid[i - 1][j] 
    }
}

print(
    grid.map{$0.map{String($0)}.joined(separator: " ")}.joined(separator: "\n")
)