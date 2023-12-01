import Foundation

precedencegroup ForwardPipe{associativity: left}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let (a, b) = readLine()!.split(separator: " ").map{Int($0)!} |> {($0[0], $0[1])}

func solution(_ a: Int, _ b: Int) -> Int {
    return (a...b).filter{$0 % 2 == 0}.reduce(0, +)
}

let answer = solution(a, b)

print(answer)