import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

public func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let (char, n) = readLine()!.split(separator: " ") |> {(String($0[0]), Int($0[1])!)}

func solution(_ char: String, _ n: Int) -> String {
    var start = 0, end = 0, unit = 0

    switch char {
        case "A":
            (start, end, unit) = (1, n + 1, 1)
            break
        case "D":
            (start, end, unit) = (n, 0, -1)
            break
        default:
            break
    }

    return stride(from: start, to: end, by: unit).map{String($0)}.joined(separator: " ")
}

let answer = solution(char, n)

print(answer)