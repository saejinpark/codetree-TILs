import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

public func |> <T, U> (value: T, function : (T) -> U) -> U {
    return function(value)
}

let (a, b) = readLine()!.split(separator: " ").map{Int($0)!} |> {($0[0], $0[1])}

func solution(_ a: Int, _ b: Int) -> String {
    var arr = [Int](), current = a
    
    while current < b{
        arr.append(current)
        current = current % 2 == 0 ? current + 3 : current * 2
    }
    arr.append(current)

    return arr.map{String($0)}.joined(separator: " ") 
}

let answer = solution(a, b) 

print(answer)