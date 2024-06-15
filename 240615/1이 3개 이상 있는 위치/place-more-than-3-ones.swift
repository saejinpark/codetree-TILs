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
    if temp.count != nums.count { return nil }
    return nums
}

let dCoords = [
    (0, 1), (0, -1), (1, 0), (-1, 0)
]

func solution(input: (Int, [[Int]])) -> Int {
    let (n, grid) = input
    var count = 0
    for row in 0..<n {
        for col in 0..<n {
            var testCase = 0
            for (dRow, dCol) in dCoords {
                let nRow = row + dRow
                let nCol = col + dCol
                if nRow < 0 || n <= nRow {
                    continue
                }
                if nCol < 0 || n <= nCol {
                    continue
                }
                if grid[nRow][nCol] == 1 {
                    testCase += 1
                }
            }
            if testCase >= 3 {
                count += 1
            }
        }
    }

    return count
}

func main() {
    guard let n = readNum() else { return }
    let grid = (1...n).compactMap({_ in readNums()})
    if grid.count != n { return }
    print((n, grid) |> solution)
}

main()