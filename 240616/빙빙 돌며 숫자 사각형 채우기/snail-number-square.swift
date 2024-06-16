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

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

class Coord: Hashable, Equatable, CustomStringConvertible {
    let row: Int
    let col: Int
    
    init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(row)
        hasher.combine(col)
    }

    static func == (lhs: Coord, rhs: Coord) -> Bool {
        return lhs.row == rhs.row && lhs.col == rhs.col
    }

    var description: String {
        return "(\(row) \(col))"
    }
}

let directionCoordList = [
    Coord(row: 0, col: 1),
    Coord(row: 1, col: 0),
    Coord(row: 0, col: -1),
    Coord(row: -1, col: 0)
]

let directionCoordSet = Set<Coord>()

let genNum = {
    var num = 1
    return {
        defer {
            num += 1
        }
        return num
    }
}()

func emptyGrid(n: Int, m: Int) -> [[Int]] {
    return Array(repeating: Array(repeating: 0, count: m), count: n)
}

func nextRowCol(directIndex: Int, coord: Coord) -> (Int, Int) {
    let directionCoord = directionCoordList[directIndex]
    return (coord.row + directionCoord.row, coord.col + directionCoord.col)
}

func solution(wrapper: (Int, Int)) -> String {
    let (n, m) = wrapper
    var grid = emptyGrid(n: n, m: m)
    var coordSet: Set<Coord> = []
    var currentDirectionCoordIndex = 0
    var currentCoord = Coord(row: 0, col: 0)
    while !coordSet.contains(currentCoord) {
        grid[currentCoord.row][currentCoord.col] = genNum()
        coordSet.insert(currentCoord)
        var (nRow, nCol) = nextRowCol(
            directIndex: currentDirectionCoordIndex,
            coord: currentCoord
        )
        if nRow < 0 || n <= nRow || nCol < 0 || m <= nCol || coordSet.contains(Coord(row: nRow, col: nCol)) {
            currentDirectionCoordIndex = (currentDirectionCoordIndex + 1) % directionCoordList.count
            (nRow, nCol) = nextRowCol(
                directIndex: currentDirectionCoordIndex,
                coord: currentCoord
            )
        }
        currentCoord = Coord(row: nRow, col: nCol)
    }

    var temp: [String] = []
    for row in grid {
        temp.append(row.map(String.init).joined(separator: " "))
    }

    return temp.joined(separator: "\n")
}

func main() {
    guard let (n, m)  = readNumPair() else { return }
    print((n, m) |> solution)
}

main()