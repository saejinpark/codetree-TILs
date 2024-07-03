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
    let nums = temp.compactMap{Int($0)}
    return temp.count == nums.count ? nums : nil
}

func readNumPair() -> (Int, Int)? {
    guard let nums = readNums(), nums.count == 2
    else { return nil }
    return (nums[0], nums[1])
}

func emptyGrid(n: Int, m: Int) -> [[Int]] {
    return Array(repeating: Array(
        repeating: 0,
        count: m
    ), count: n)
}

let dl = [
    (1, 0),
    (0, 1),
    (-1, 0),
    (0, -1)
]

struct Coord: Hashable {
    var y: Int
    var x: Int

    init(coord: (Int, Int)) {
        self.y = coord.0
        self.x = coord.1
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(y)
        hasher.combine(x)
    }
}

func solution(component: (Int, Int)) -> String {
    let (n, m) = component
    var grid = emptyGrid(n: n, m: m)
    var currentDlIndex = 0
    var visited: Set<Coord> = []
    var currentCoord = (0, 0) 
    visited.insert(Coord(coord: currentCoord))
    var genNum = {
        var num = 1
        return {
            defer {
                num += 1
            }
            return num
        }
    }()
    grid[0][0] = genNum()

    var testCase = 0    

    while true {
        if testCase == 4 {
            break
        }

        var (dy, dx) = dl[currentDlIndex % 4]
        var (y, x) = currentCoord
        var (ny, nx) = (y + dy, x + dx)
        var nextCoord = Coord(coord: (ny, nx))
        
        if ny < 0 || n <= ny || nx < 0 || m <= nx || visited.contains(nextCoord) {
            testCase += 1
            currentDlIndex += 1
            continue
        }  

        grid[ny][nx] = genNum()
        visited.insert(nextCoord)
        currentCoord = (ny, nx)
        testCase = 0
    }

    return grid.map{
                $0.map{String($0)}
                .joined(separator: " ")
            }
            .joined(separator: "\n")
}

func main() {
    guard let (n, m) = readNumPair()
    else { return }
    
    print((n, m) |> solution)
}

main()