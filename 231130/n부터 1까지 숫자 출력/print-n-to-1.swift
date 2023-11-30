import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

public func |> <T, U> (value: T, function: ((T) -> U)) -> U {
    return function(value)
}

let n = Int(readLine()!)!

func solution(_ n : Int) -> String {
    var arr = [Int]()
    var i = n
    while i >= 1 {
        arr.append(i)
        i -= 1
    }
    return arr |> {$0.map{String($0)}} |> {$0.joined(separator: " ")}

}

print(n |> solution)