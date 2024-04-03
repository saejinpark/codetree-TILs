import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let n = Int(readLine()!)!
let numToLine = {Array(1...$0).map{String($0)}.joined(separator: "")}
let lineToAnswer = {Array(repeating: $0, count: $0.count).joined(separator: "\n")}
let answer = n |> numToLine |> lineToAnswer

print(answer)