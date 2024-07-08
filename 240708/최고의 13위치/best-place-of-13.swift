import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func readGrid(n: Int) -> [[Int]]? {
    var grid: [[Int]] = []
    for i in 1...n {
        guard let nums = readNums() else { return nil }
        if nums.count != n { return nil }
        grid.append(nums)
    }
    return grid
}

func solution(grid: [[Int]]) -> Int {
    var answer = 0

    for r in 0..<grid.count {
        for c in 0..<(grid.count - 2) {
            let testCase = grid[r][c] + grid[r][c + 1] + grid[r][c + 2]
            answer = testCase > answer ? testCase : answer 
        }
    } 
    
    return answer
}

func main() {
    guard let n = readNum(), let grid = readGrid(n: n) else { return }
    print(grid |> solution)

}

main()