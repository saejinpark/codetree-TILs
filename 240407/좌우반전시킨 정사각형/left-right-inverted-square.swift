import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let n = Int(readLine()!)!

let answer = (1...n).map{
    stride(from: $0 * n, to: 0, by: -$0)
    .map{String($0)}
    .joined(separator: " ")
}.joined(separator: "\n")


print(answer)