import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

public func |> <T, U> (value: T, function: ((T) -> U)) -> U {
    return function(value)
}

let (a, b) = readLine()!.split(separator: " ").map{Int($0)!} |> {($0[1], $0[0])}

func solution(_ a: Int, _ b: Int) -> String {
    let start = b % 2 == 1 ? b - 1 : b
    let end = a - 1
    var arr = [Int]()
    var i = start
    
    while i > end {
        arr.append(i)
        i -= 2
    }

    return arr |> {$0.map{String($0)}} |> {$0.joined(separator: " ")}
}

print(solution(a, b))