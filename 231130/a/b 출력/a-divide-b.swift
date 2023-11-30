import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

public func |> <T, U> (value: T, function: ((T) -> U)) -> U {
    return function(value)
}

let (a, b) = readLine()!.split(separator: " ").map{Float($0)!} |> {($0[0], $0[1])}

print(String(format: "%.20f", a / b))