import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

typealias Coord = (Int, Int)

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums 
}

func readNumPair() -> Coord? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func empthGrid(n: Int) -> [[Int]] {
    return Array(repeating: Array(repeating: n, count: n), count: n)
}

func solution(input: (Int, Int, [Coord])) -> String {
    var arr: [Int] = []
    let (n, m, coords) = input
    let paintCoords = coords.map{(a, b) in return (a - 1, b - 1)}
    var grid = empthGrid(n: n)
    for i in 0..<m {
        let (row, col) = paintCoords[i]
        grid[row][col] = 1
        var testCase = 0
        for (dr, dc) in [(-1, 0), (0, 1), (1, 0), (0, -1)] {
            let testRow = row + dr
            let testCol = col + dc
            if testRow < 0 || n <= testRow || testCol < 0 || n <= testCol {
                continue
            }
            if grid[testRow][testCol] == 1 {
                testCase += 1
            }
        }
        arr.append(testCase == 3 ? 1 : 0)
    }
    return arr.map(String.init).joined(separator: "\n")
}

func main() {
    guard let (n, m) = readNumPair() else { return }
    let coords = (1...m).compactMap({_ in readNumPair()})
    print((n, m, coords) |> solution)
}

main()