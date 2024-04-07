import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let n = Int(readLine()!)!

let numToLine = {
    return stride(from: $0, to: 0, by: -1)
        .map{String($0)}
        .joined(separator: " ")
}

let answer = (1...n).map{_ in return n |> numToLine}.joined(separator: "\n")

print(answer)