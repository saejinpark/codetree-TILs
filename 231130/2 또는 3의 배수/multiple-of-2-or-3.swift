import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

public func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let n = Int(readLine()!)!

func solution(_ n: Int) -> String {
    return (1...n).map{
            String($0 != 0 && ($0 % 2 == 0 || $0 % 3 == 0) ? 1 : 0)
        }.joined(separator: " ")
}

let answer = solution(n)

print(answer)