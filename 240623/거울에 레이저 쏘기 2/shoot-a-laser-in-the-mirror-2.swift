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

typealias Coord = (Int, Int)

let directDict = [
    "U": (-1, 0),
    "R": (0, 1),
    "D": (1, 0),
    "L": (0, -1)
]

class Laser: Equatable, Hashable {
    var coord: Coord
    var direct: String

    init(coord: Coord, direct: String) {
        self.coord = coord
        self.direct = direct
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(coord.0)
        hasher.combine(coord.1)
        hasher.combine(direct)
    }

    static func == (lhs: Laser, rhs: Laser) -> Bool {
        return lhs.coord == rhs.coord && lhs.direct == rhs.direct
    }

    func turn(mirror: String) {
        switch mirror {
        case "/":
            if direct == "U" {
                direct = "R"
            } else if direct == "R" {
                direct = "U"
            } else if direct == "D" {
                direct = "L"
            } else {
                direct = "D"
            }
        case "\\":
            if direct == "U" {
                direct = "L"
            } else if direct == "L" {
                direct = "U"
            } else if direct == "D" {
                direct = "R"
            } else {
                direct = "D"
            }
        default:
            return
        }
    }

    func move() {
        guard let (dRow, dCol) = directDict[direct] else { return }
        coord = (coord.0 + dRow, coord.1 + dCol)
    }

    func isOut(n: Int) -> Bool {
        let (row, col) = coord
        return row < 0 || n <= row || col < 0 || n <= col
    }
}

func startPointDirectToDirect(direct: String) -> String {
    switch direct {
    case "D":
        return "R"
    case "L":
        return "D"
    case "U":
        return "L"
    default:
        return "U"
    }
}

func genStartPoints(n: Int) -> [Laser] {
    var visited: Set<Laser> = []
    var startPoints: [Laser] = []
    var current = Laser(coord: (0, 0), direct: "D")
    while !visited.contains(current) {
        visited.insert(current)
        startPoints.append(current)
        var (coord, direct) = (current.coord, current.direct)
        let (cr, cc) = coord
        var (dr, dc) = directDict[startPointDirectToDirect(direct: direct)]!
        var (nr, nc) = (cr + dr, cc + dc)
        if nr < 0 || n <= nr || nc < 0 || n <= nc {
            direct = direct == "D"
                    ? "L"
                    : direct == "L"
                    ? "U"
                    : direct == "U"
                    ? "R"
                    : "D"
            (dr, dc) = directDict[startPointDirectToDirect(direct: direct)]!
            (nr, nc) = (cr, cc)
        }
        current = Laser(coord: (nr, nc), direct: direct)
    }
    return startPoints 
}

func solution(input: (Int, [[String]], Int)) -> Int {
    let (n, grid, k) = input
    let startPoints = genStartPoints(n: n)
    var laser = startPoints[k - 1]
    var count = 0
    while true {
        laser.turn(mirror: grid[laser.coord.0][laser.coord.1])
        count += 1
        laser.move()
        if laser.isOut(n: n) {
            break
        }

    }

    return count
}

func main() {
    guard let n = readNum() else { return }
    var grid: [[String]] = []
    for _ in 1...n {
        guard let line = readLine() else { return }
        grid.append(line.split(separator: "").map(String.init))
    }
    guard let k = readNum() else { return }
    
    print((n, grid, k) |> solution)
}

main()