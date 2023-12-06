import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U>(value: T, function: (T) -> U) -> U {
    return function(value)
}

let (a, b, c) = readLine()!.split(separator: " ").map{Int($0)!} |> {($0[0], $0[1], $0[2])}

func solution(_ a: Int, _ b: Int, _ c: Int) -> String {
    var bool = false
    
    for i in a...b {
        if i % c == 0 {
            bool = true
            break
        }
    }

    return bool ? "YES" : "NO"
}

let answer = solution(a, b, c)

print(answer)