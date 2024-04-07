import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let (row, col) = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
    |> {($0.first!, $0.last!)}

let answer = {
    (1...row).map{ r in
        return (1...col)
            .map{String(r * $0)}
            .joined(separator: " ")
    }.joined(separator: "\n")
}()

print(answer)