import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

public func |> <T, U> (value: T, function: ((T) -> U)) -> U {
    return function(value)
}

var str = readLine()!

func solution(_ str: String) -> String {
    var answer = ""

    for _ in 1...8 {
        answer += str
    }

    return answer
}

print(solution(str))