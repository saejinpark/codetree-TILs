import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func turn(d: String, coord: (Int, Int)) -> (Int, Int) {
    switch d {
    case "L":
        if coord.0 == 0 && coord.1 == 1 {
            return (-1, 0)
        } else if coord.0 == -1 && coord.1 == 0 {
            return (0, -1)
        } else if coord.0 == 0 && coord.1 == -1 {
            return (1, 0)
        } else {
            return (0, 1)
        }
    case "R":
        if coord.0 == 0 && coord.1 == 1 {
            return (1, 0)
        } else if coord.0 == 1 && coord.1 == 0 {
            return (0, -1)
        } else if coord.0 == 0 && coord.1 == -1 {
            return (-1, 0)
        } else {
            return (0, 1)
        }
    default:
        return (0, 0)
    }
}

func solution(dline: String) -> String {
    let dArr = Array(dline).map(String.init)

    var currentCoord = (0, 0)
    var dCoord = (0, 1)

    for d in dArr {
        switch d {
        case "L",  "R":
            dCoord = turn(d: d, coord: dCoord)
        case "F":
            currentCoord.0 += dCoord.0
            currentCoord.1 += dCoord.1
        default:
            return "-1"
        }
    }

    return "\(currentCoord.0) \(currentCoord.1)"
}

func main() {
    guard let line = readLine() else { return }
    print(line |> solution)
}

main()