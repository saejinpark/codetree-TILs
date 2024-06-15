import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

typealias Move = (String, Int)

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readMove() -> Move? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    guard temp.count == 2, let count = Int(temp[1]) else { return nil }
    return (String(temp[0]), count)
}

func getDCoord(d: String) -> (Int, Int) {
    switch d {
    case "E":
        return (1, 0)
    case "W":
        return (-1, 0)
    case "S":
        return (0, -1)
    case "N":
        return (0, 1)
    default:
        return (0, 0)
    }
}

func solution(moves: [Move]) -> String {
    var coord = (0, 0)
    for (d, count) in moves {
        for _ in 1...count {
            let (dx, dy) = getDCoord(d: d)
            coord.0 += dx
            coord.1 += dy
        }
    }
    return "\(coord.0) \(coord.1)"
}

func main() {
    guard let n = readNum() else { return }
    let moves = (1...n).compactMap({_ in readMove()})

    print(moves |> solution)
}

main()