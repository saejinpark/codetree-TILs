import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U>(value: T, function: (T) -> U) -> U {
    return function(value)
}

let (a, b, c, d, e) = Array(0...4).map{(n: Int) -> Int in Int(readLine()!)!} |> {($0[0], $0[1], $0[2], $0[3], $0[4])}

func solution(_ a : Int, _ b : Int, _ c : Int, _ d : Int, _ e : Int) -> Int {
    for i in [a, b, c, d, e] {
        if i % 3 != 0 {
            return 0
        }
    }
    return 1
}

let answer = solution(a, b, c, d, e)

print(answer)