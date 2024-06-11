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
    if temp.count != nums.count { return nil }
    return nums
}

typealias Coord = (Int, Int)
typealias CoordPair = (Coord, Coord)

func readCoordPair() -> CoordPair? {
    guard let nums = readNums(), nums.count == 4 else { return nil }
    return ((nums[0], nums[1]), (nums[2], nums[3]))
}

func gridGetArea(grid: [[Int]]) -> Int {
    var sum = 0
    for row in grid {
        sum += row.reduce(0, +)        
    }
    return sum
}

func solution(coordPairs: [CoordPair]) -> Int {
    let (a, b, m) = coordPairs |> {($0[0], $0[1], $0[2])}
    let offset = 1000
    var grid = Array(
        repeating: Array(
                repeating: 0,
                count: offset * 2 + 1
            ),
            count: offset * 2 + 1
        )
    for (start, end) in [a, b] {
        let (sx, sy) = start
        let (ex, ey) = end
        for y in sy..<ey {
            for x in sx..<ex {
                grid[y][x] = 1
            }
        }
    }
    let (sx, sy) = m.0
    let (ex, ey) = m.1
    for y in sy..<ey {
        for x in sx..<ex {
            grid[y][x] = 0
        }
    }

    return grid |> gridGetArea
}

func main() {
    let coordPairs = (1...3).compactMap({_ in readCoordPair()})
    if coordPairs.count != 3 { return }
    print(coordPairs |> solution)
}

main()