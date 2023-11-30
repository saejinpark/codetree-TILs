import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

public func |> <T, U>(value: T, function: ((T) -> U)) -> U {
    return function(value)
}

let (a, b) = readLine()! |> {$0.split(separator: " ")} |> {$0.map{Int($0)!}} |> {($0[1], $0[0])}

func solution(_ a : Int, _ b : Int) -> String {
    let start = b % 2 == 1 ? b : b - 1
    let end = a - 1
    var i = start
    var arr = [Int]()
    while i > end {
        arr.append(i)
        i -= 2
    }
    return arr |> {$0.map{String($0)}} |> {$0.joined(separator: " ")}
}

print((a, b) |> {solution($0, $1)})