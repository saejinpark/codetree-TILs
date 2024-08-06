import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func readGrid() -> [[Int]]? {
    var grid = [[Int]]()
    for _ in 0..<19 {
        guard let nums = readNums() else { return nil }
        grid.append(nums)
    }
    return grid
}

func idxStartEnd(idx: Int, limit: Int) -> (Int, Int)? {
    if idx - 2 < 0 || limit <= idx + 2 { return nil }
    return (idx - 2, idx + 2)
}

func solution(grid: [[Int]]) -> String {
    var winner = -1
    var coord = (-1, -1)

    for row in 0..<grid.count {
        var flag = false
        for col in 0..<grid.count {
            if let (rs, re) = idxStartEnd(idx: row, limit: 19) {
                var first = 0
                var second = 0
                for i in (rs...re) {
                    if grid[i][col] == 1 {
                        first += 1
                    }
                    if grid[i][col] == 2 {
                        second += 1
                    }
                }
                if first == 5 || second == 5 {
                    winner = first == 5 ? 1 : 2
                    coord = (row + 1, col + 1)
                    flag = true
                    break
                }
            }
            if let (cs, ce) = idxStartEnd(idx: col, limit: 19) {
                var first = 0
                var second = 0
                for i in (cs...ce) {
                    if grid[row][i] == 1 {
                        first += 1
                    }
                    if grid[row][i] == 2 {
                        second += 1
                    }
                }
                if first == 5 || second == 5 {
                    winner = first == 5 ? 1 : 2
                    coord = (row + 1, col + 1)
                    flag = true
                    break
                }
            }
        }
        if flag {
            break
        }
    }

    if winner == -1 {
        return "0"
    }
    return "\(winner)\n\(coord.0) \(coord.1)"
}

func main() {
    guard let grid = readGrid() else { return }
    print(grid |> solution)
}

main()