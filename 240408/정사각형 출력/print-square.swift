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

for i in 1...n {
    
    var line = ""

    let e = i * n
    let s = e - (n - 1)

    for j in s...e {
        line += String(j)
        if j != e {
            line += " "
        }
    }
    answer += line

    if i != n {
        answer += "\n"
    }
}

print(answer)