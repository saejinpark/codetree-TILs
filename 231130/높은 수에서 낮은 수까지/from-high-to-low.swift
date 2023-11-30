import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

public func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let (a, b) = readLine()!.split(separator: " ").map{Int($0)!} |> {($0[0], $0[1])}

func solution(_ a: Int, _ b: Int) -> String {
    let (start, end) = a > b ? (a, b - 1) : (b, a - 1)

    return stride(from: start, to: end, by: -1).map{String($0)}.joined(separator: " ")
}

let answer = solution(a, b)

print(answer)