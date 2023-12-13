import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U>(value: T, function: (T) -> U) -> U {
    return function(value)
}

let (n, m) = readLine()!.split(separator: " ").map{Int($0)!} |> {($0[0], $0[1])}

func solution(_ n : Int, _ m : Int) -> String {
    return Array(repeating: Array(repeating: "*", count: m).joined(separator: " "), count: n).joined(separator: "\n")
}


let answer = solution(n, m)

print(answer)