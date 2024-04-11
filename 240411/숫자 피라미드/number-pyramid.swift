import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func input() -> Int? {
    guard let line = readLine(), let num = Int(line)
    else {
        return nil
    }
    return num
}

func numToLine(_ num: Int) -> String {
    return (1...num).map{_ in String(num)}.joined(separator: " ")
}

if let num = input() {
    print(
        (1...num).map{
            numToLine($0)
        }.joined(separator: "\n")
    )
}