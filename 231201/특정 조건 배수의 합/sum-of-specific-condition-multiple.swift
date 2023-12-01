import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

public func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let (a, b) = readLine()!.split(separator: "").map{Int($0)!} |> {($0[0], $0[1])}