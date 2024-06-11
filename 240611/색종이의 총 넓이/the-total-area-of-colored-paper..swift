import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

typealias Coord = (Int, Int)

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

func readCoord() -> Coord? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func gridToArea(grid: [[Int]]) -> Int {
    var sum = 0
    for row in grid {
        sum += row.reduce(0, +)
    }
    return sum
}

func solution(leftBottomPoints: [Coord]) -> Int {
    let offset = 100
    var grid = Array(
                    repeating: Array(
                        repeating: 0,
                        count: offset * 2 + 1
                    ),
                    count: offset * 2 + 1
                )
    for (x, y) in leftBottomPoints {
        for ay in 0..<8 {
            for ax in 0..<8 {
                grid[y + ay + offset][x + ax + offset] = 1
            }
        }
    }
    return grid |> gridToArea
}

func main() {
    guard let n = readNum() else { return }
    let coords = (1...n).compactMap({_ in readCoord()})
    if n != coords.count { return }
    print(coords |> solution)
}

main()