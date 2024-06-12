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
typealias Grid = [[Int]]

let OFFSET = 100

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

func readCoordPair() -> CoordPair? {
    guard let nums = readNums(), nums.count == 4 else { return nil }
    return ((nums[0], nums[1]), (nums[2], nums[3]))
}

func paint(grid: inout Grid, coordPair: CoordPair, isRed: Bool) {
    let (start, end) = coordPair
    let (sx, sy) = start
    let (ex, ey) = end

    for y in sy..<ey {
        for x in sx..<ex {
            grid[y + OFFSET][x + OFFSET] = isRed ? 1 : 2
        }
    }
}

func aria(grid: Grid) -> Int{
    var stack = 0

    for y in 0..<grid.count {
        for x in 0..<grid[y].count {
            if grid[y][x] == 2 {
                stack += 1
            }
        }
    }

    return stack
}

func solution(coordPairs: [CoordPair]) -> Int {
    var grid = Array(
        repeating: Array(
            repeating: 0,
            count: OFFSET * 2 + 1
        ),
        count: OFFSET * 2 + 1
    )

    var isRed = true

    for coordPair in coordPairs {
        paint(grid: &grid, coordPair: coordPair, isRed: isRed)
        isRed.toggle()
    }

    return aria(grid: grid)
}

func main() {
    guard let n = readNum() else { return }
    let coordPairs = (1...n).compactMap({_ in readCoordPair()})
    print(coordPairs |> solution)
}

main()