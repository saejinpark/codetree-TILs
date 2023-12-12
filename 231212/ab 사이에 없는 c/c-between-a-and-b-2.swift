import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U>(value: T, function: (T) -> U) -> U {
    return function(value)
}

let (a, b, c) = readLine()!.split(separator: " ").map{Int($0)!} |> {($0[0], $0[1], $0[2])}

func solution(_ a : Int, _ b : Int, _ c : Int) -> Bool {
    var bool = false
    for i in a...b {
        if c % i == 0 {
            bool = true
            break
        }
    }
    return bool
}

let answer = solution(a, b, c) ? "YES" : "NO"

print(answer)