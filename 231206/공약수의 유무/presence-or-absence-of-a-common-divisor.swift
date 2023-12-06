import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U>(value: T, function: (T) -> U ) -> U {
    return function(value)
}

let (a, b) = readLine()!.split(separator: " ").map{Int($0)!} |> {($0[0], $0[1])}


func solution(_ a: Int, _ b: Int) -> Int {
    var bool = false

    for i in a...b {
        if 1920 % i == 0 && 2880 % i == 0 {
            bool = true
            break
        } 
    }

    return bool ? 1 : 0
}

let answer = solution(a, b)

print(answer)