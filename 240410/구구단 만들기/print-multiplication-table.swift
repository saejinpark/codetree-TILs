import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) ->  U {
    return function(value)
}

let (a, b) = readLine()!
    |> {$0.split(separator: " ").map{Int($0)!}}
    |> {($0[0], $0[1])}

let start = b % 2 == 0 ? b : b - 1

let answer = (1...9)
                .map{ first in
                    stride(from: start, to: a - 1, by: -2)
                        .map { second in
                            "\(second) * \(first) = \(first * second)"
                        }.joined(separator: " / ")
                }.joined(separator: "\n")
print(answer)