import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

typealias Coord = (Int, Int)

typealias CoordPair = (Coord, Coord)

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func readCoordPair() -> CoordPair? {
    guard let nums = readNums(), nums.count == 4 else { return nil}
    return ((nums[0], nums[1]), (nums[2], nums[3]))
}

func gridToArea(grid: [[Int]]) -> Int {
    var sum = 0
    for row in grid {
        sum += row.reduce(0, +)
    }
    return sum
}

func solution(coordPairs: [CoordPair]) -> Int {
    let offset = 1000
    var grid = Array(repeating: Array(repeating: 0, count: offset * 2 + 1), count: offset * 2 + 1)


    for i in 0..<coordPairs.count {
        let (start, end) = coordPairs[i]
        let (sx, sy) = start
        let (ex, ey) = end
        for y in sy..<ey {
            for x in sx..<ex {
                grid[y + offset][x + offset] = 1 - i
            }
        }

    }

    var lb = (2001, 2001)
    var rt = (0, 0)
    var hasArea = false

    for y in 0..<grid.count {
        for x in 0..<grid[y].count {
            if grid[y][x] == 1 {
                hasArea = true
                lb.0 = [lb.0, y].min()!
                lb.1 = [lb.1, x].min()!
                rt.0 = [rt.0, y].max()!
                rt.1 = [rt.1, x].max()!
            }
        }
    }

    if !hasArea {
        return 0
    }

    grid = Array(repeating: Array(repeating: 0, count: offset * 2 + 1), count: offset * 2 + 1)

    let (sx, sy) = lb
    let (ex, ey) = rt
    for y in sy...ey {
        for x in sx...ex {
            grid[y][x] = 1
        }
    }

    return grid |> gridToArea
}


func main() {
    let coordPairs = (1...2).compactMap({_ in readCoordPair()})
    if coordPairs.count != 2 { return }
    print(coordPairs |> solution)
}

main()