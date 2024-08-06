import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let dList = [(0, 1), (1, 0), (1, -1), (1, 1)]

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

func genStartAndEnd(coord: (Int, Int), d: (Int, Int)) -> [(Int, Int)]? {
    if coord.0 - d.0 * 2 < 0 || 19 <= coord.0 - d.0 * 2
    || coord.1 - d.1 * 2 < 0 || 19 <= coord.1 - d.1 * 2
    || coord.0 + d.0 * 2 < 0 || 19 <= coord.0 + d.0 * 2
    || coord.1 + d.1 * 2 < 0 || 19 <= coord.1 + d.1 * 2 {
        return nil
    }
    return [
        (coord.0 - d.0 * 2, coord.1 - d.1 * 2),
        (coord.0 - d.0, coord.1 - d.1),
        coord,
        (coord.0 + d.0, coord.1 + d.1),
        (coord.0 + d.0 * 2, coord.1 + d.1 * 2),
    ]
}

func solution(grid: [[Int]]) -> String {
    var winner = -1
    var temp = (-1, -1)

    for row in 0..<19 {
        var flag = false
        for col in 0..<19 {
            for d in dList {
                if let coords = genStartAndEnd(coord: (row, col), d: d) {
                    var first = 0
                    var second = 0

                    for (r, c) in coords {
                        if grid[r][c] == 1 {
                            first += 1
                        } else if grid[r][c] == 2 {
                            second += 1
                        }
                    }

                    if first == 5 || second == 5 {
                        flag = true
                        winner = first == 5 ? 1 : 2
                        temp = (row + 1, col + 1)
                        break
                    }
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

    return "\(winner)\n\(temp.0) \(temp.1)"
}

func main() {
    guard let grid = readGrid() else { return }
    print(grid |> solution)
}

main()