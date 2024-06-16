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
    guard temp.count == 2,let num = Int(temp[1]) else { return nil }
    return (String(temp[0]), num)
}

let directionDict = [
    "E": (0, 1), 
    "W": (0, -1),
    "S": (1, 0),
    "N": (-1, 0)
]

func solution(moves: [Move]) -> Int {
    var current = (0, 0)
    var endPoint = (0, 0)
    var count = 0

    for (d, t) in moves {
        guard let (dRow, dCol) = directionDict[d] else { return -1 }
        for _ in 1...t {
            count += 1
            current.0 += dRow
            current.1 += dCol
            if current == endPoint {
                return count
            }
        }
    }

    return -1
}

func main() {
    guard let num = readNum() else { return }
    let moves = (1...num).compactMap({_ in readMove()})
    print(moves |> solution)
}

main()