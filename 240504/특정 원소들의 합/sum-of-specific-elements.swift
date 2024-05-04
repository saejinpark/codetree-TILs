import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func readGrid() -> [[Int]]? {
    var grid:[[Int]] = []

    for _ in 1...4 {
        if let nums = readNums(), nums.count == 4 {
            grid.append(nums)
        } else { return nil }
    }
    return grid
}

func solution(grid:[[Int]]) -> Int {
    var sum = 0
    for i in 0..<4 {
        let limit = 4 - (4 - i)
        for j in 0...limit {
            sum += grid[i][j]
        }
    }
    return sum
}

func main() {
    if let grid = readGrid() {
        print(grid |> solution)
    }
}

main()