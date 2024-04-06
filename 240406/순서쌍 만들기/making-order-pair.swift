import Foundation

precedencegroup ForwarkPipe {
    associativity: left
}

infix operator |> : ForwarkPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let n = Int(readLine()!)!

func genLine(_ first: Int, _ second: Int) -> String {
    return "(\(first),\(second))"
}

let answer = {
    return stride(from: n, to: 0, by: -1).map{ first in
        stride(from: n, to: 0, by: -1).map{ second in
            return genLine(first, second)
        }.joined(separator: " ")
    }.joined(separator: "\n")
}()


print(answer)