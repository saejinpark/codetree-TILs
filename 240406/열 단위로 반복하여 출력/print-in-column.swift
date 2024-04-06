import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}


let n = Int(readLine()!)!

var answer = (1...n).map{
    let temp = String($0)
    return (1...n).map{_ in return temp}.joined(separator: "")
}.joined(separator: "\n")

print(answer)