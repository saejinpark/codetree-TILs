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
    var grid = [[Int]]()
    for i in 1...n {
        guard let nums = readNums(), nums.count == n else { return nil }
        grid.append(nums)
    }

    return grid
}

class Coord: Hashable {
    let row: Int
    let col: Int

    init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }

    static func == (lhs: Coord, rhs: Coord) -> Bool {
        return lhs.row == rhs.col && lhs.col == rhs.col
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(row)
        hasher.combine(col)
    }

    func find(grid: [[Int]]) -> Int {
        return grid[row][col]
    }
}

typealias CoordSet = Set<Coord>

func solution(component: (Int, [[Int]])) -> Int {
    let (n, grid) = component
    var setArr = [CoordSet]()
    var answer = 0

    for i in 0..<n {
        for j in 2..<n {
            var coordSet = CoordSet()
            
            coordSet.insert(Coord(row: i, col: j - 2))
            coordSet.insert(Coord(row: i, col: j - 1))
            coordSet.insert(Coord(row: i, col: j))

            setArr.append(coordSet)
        }
    }
    for i in 0..<setArr.count {
        for j in (i + 1)..<setArr.count {
            let first = setArr[i]
            let second = setArr[j]
            let unionSet = first.union(second)
            if unionSet.count == 6 {
                var testCase = 0
                for item in unionSet {
                    testCase += item.find(grid: grid)
                }
                answer = testCase > answer ? testCase : answer

            }
        }
    }

    return answer
}

func main() {
    guard let n = readNum(), let grid = readGrid(n: n) else { return }
    print((n, grid) |> solution)
}

main()