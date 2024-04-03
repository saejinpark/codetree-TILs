import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let n = Int(readLine()!)!



func numToLine(_ num: Int) -> String {
    return Array(1...num).map{String($0)}.joined(separator: "")
}

func lineToAnswer(_ line: String) -> String {
    return Array(repeating: line, count: line.count).joined(separator: "\n")
}

let answer = n |> numToLine |> lineToAnswer

print(answer)