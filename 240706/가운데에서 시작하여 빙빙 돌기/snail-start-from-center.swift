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
    Coord(row: 0, col: -1),
    Coord(row: -1, col: 0),
    Coord(row: 0, col: 1),
    Coord(row: 1, col: 0),
]

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func emptyIndexGrid(n: Int) -> [[Int]] {
    return Array(repeating: Array(repeating: 0, count: n), count: n)
}


func genSnailGrid(n: Int) -> [[Int]] {
    var indexGrid = n |> emptyIndexGrid
    var dIndex = 0
    var testCase = 0
    var currentCoord = Coord(row: n - 1, col: n - 1)
    var visited: Set<Coord> = [currentCoord]
    let limit = n * n

    let genNum = {
        var num = 1
        return {
            defer {
                num += 1
            }

            return num
        }
    }()

    indexGrid[n - 1][n - 1] = limit

    while true {
        if testCase == 2 {
            break
        }
        let dCoord = dl[dIndex % dl.count]
        let (dr, dc) = dCoord.getRowAndCol()
        let (r, c) = currentCoord.getRowAndCol()
        let (nr, nc) = (r + dr, c + dc)
        let nCoord = Coord(row: nr, col: nc)
        
        if nr < 0 || n <= nr || nc < 0 || n <= nc || visited.contains(nCoord) {
            testCase += 1
            dIndex += 1
            continue
        }

        currentCoord = nCoord
        testCase = 0
        indexGrid[nr][nc] = limit - genNum()
        visited.insert(currentCoord)
    }

    return indexGrid
}

func solution(n: Int) -> String {
    let snailGrid = n |> genSnailGrid

    return snailGrid.map{$0.map(String.init).joined(separator: " ")}.joined(separator: "\n")
}

func main() {
    guard let n = readNum() else { return }

    print(n |> solution)
}

main()