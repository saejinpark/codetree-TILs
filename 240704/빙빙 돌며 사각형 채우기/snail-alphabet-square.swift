import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

struct Coord: Hashable {
    var row: Int
    var col: Int
    
    init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(row)
        hasher.combine(col)
    }

    func getRowAndCol() -> (Int, Int) {
        return (row, col)
    }
}

let dl = [
    Coord(row: 0, col: 1),
    Coord(row: 1, col: 0),
    Coord(row: 0, col: -1),
    Coord(row: -1, col: 0),
]

let alphaList = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split(separator: "").map(String.init)

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap{ Int($0) }
    return temp.count == nums.count ? nums : nil 
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2 else { return nil }
    return (nums[0], nums[1])
}

func emptyIndexGrid(row: Int, col: Int) -> [[Int]] {
    return Array(repeating: Array(repeating: 0, count: col), count: row)
}

func emptyAlphaGrid(row: Int, col: Int) -> [[String]] {
    return Array(repeating: Array(repeating: "A", count: col), count: row)
}

func genSnailGrid(row: Int, col: Int) -> [[Int]] {
    var indexGrid = emptyIndexGrid(row: row, col: col)
    var dIndex = 0
    var testCase = 0
    var currentCoord = Coord(row: 0, col: 0)
    var visited: Set<Coord> = [currentCoord]

    let genNum = {
        var num = 0
        return {
            defer {
                num += 1
            }

            return num
        }
    }()

    indexGrid[0][0] = genNum()

    while true {
        if testCase == 2 {
            break
        }
        let dCoord = dl[dIndex % dl.count]
        let (dr, dc) = dCoord.getRowAndCol()
        let (r, c) = currentCoord.getRowAndCol()
        let (nr, nc) = (r + dr, c + dc)
        let nCoord = Coord(row: nr, col: nc)
        
        if nr < 0 || row <= nr || nc < 0 || col <= nc || visited.contains(nCoord) {
            testCase += 1
            dIndex += 1
            continue
        }

        currentCoord = nCoord
        testCase = 0
        indexGrid[nr][nc] = genNum()
        visited.insert(currentCoord)
    }

    return indexGrid
}

func solution(component: (Int, Int)) -> String {
    let (n, m) = component

    let snailGrid = genSnailGrid(row: n, col: m)
    var alphaGrid = emptyAlphaGrid(row: n, col: m)

    for row in 0..<snailGrid.count {
        for col in 0..<snailGrid[row].count {
            alphaGrid[row][col] = alphaList[snailGrid[row][col] % alphaList.count]
        }
    }

    return alphaGrid.map{$0.joined(separator: " ")}.joined(separator: "\n")
}

func main() {
    guard let (n, m) = readNumPair() else { return }

    print((n, m) |> solution)
}

main()