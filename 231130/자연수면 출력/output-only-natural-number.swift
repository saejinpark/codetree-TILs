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
    return a <= 0 ? "0" : (1...b).map{_ in return String(a)}.joined(separator: "")
}

let answer = solution(a, b)

print(answer)