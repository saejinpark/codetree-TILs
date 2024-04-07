import Foundation

precedencegroup FowardPipe {
    associativity: left
}

infix operator |> : FowardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let n = Int(readLine()!)!

var answer = ""

for i in 0..<n {
    let start = 1 + i * n
    let end = start + n - 1
    
    answer += (start...end).map{String($0)}.joined(separator: " ")
    if i != n {
        answer += "\n"
    } 
}

print(answer)