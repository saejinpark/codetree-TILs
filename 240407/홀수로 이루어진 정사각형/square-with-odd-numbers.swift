import Foundation

precedencegroup ForwardPipe {
    associativity:left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T)-> U) -> U {
    return function(value)
}

let n = Int(readLine()!)!
let end = n - 1

var temp = [String]()
for i in 0...end {
    var line = ""
    for j in 0...end {
        line += " " + String((i + j) * 2 + 11)
    }
    temp.append(line.trimmingCharacters(in: NSCharacterSet.whitespaces))
}

let answer = temp.joined(separator: "\n")

print(answer)