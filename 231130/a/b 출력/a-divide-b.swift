import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

public func |> <T, U> (value: T, function: ((T) -> U)) -> U {
    return function(value)
}

let (a, b) = readLine()!.split(separator: " ").map{Int($0)!} |> {($0[0], $0[1])}

var text = "\(a / b)."

var remain = a % b

for _ in 1...20 {
    remain *= 10
    text += "\(remain / b)"
    remain %= b
}

print(text)