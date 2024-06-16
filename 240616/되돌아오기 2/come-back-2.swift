import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func solution(commands: [String]) -> Int {
    var current = (0, 0)
    let endPoint = (0, 0)
    var currentDirect = (-1, 0)
    var count = 0
    for command in commands {
        count += 1
        switch command {
        case "F":
            let nRow = current.0 + currentDirect.0
            let nCol = current.1 + currentDirect.1
            current = (nRow, nCol)
            if current == endPoint {
                return count
            }
        case "L":
            currentDirect = currentDirect == (-1, 0)
                    ? (0, -1)
                    : currentDirect == (0, -1)
                    ? (1, 0)
                    : currentDirect == (1, 0)
                    ? (0, 1)
                    : (-1, 0)  
        case "R":
            currentDirect = currentDirect == (-1, 0)
                    ? (0, 1)
                    : currentDirect == (0, 1)
                    ? (1, 0)
                    : currentDirect == (1, 0)
                    ? (0, -1)
                    : (-1, 0)
        default:
            return -1
        }
    }

    return -1
}

func main() {
    guard let line = readLine() else { return }
    let commands = Array(line).map(String.init)
    print(commands |> solution)
}

main()