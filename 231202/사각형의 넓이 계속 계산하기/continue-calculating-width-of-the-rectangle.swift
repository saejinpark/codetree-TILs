import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, _func: (T) -> U) -> U {
    return _func(value)
}


func solution() -> String {
    var arr = [String]()
    while true {
        let (w, h, c) = readLine()!.split(separator: " ") |> {(Int($0[0])!, Int($0[1])!, $0[2])}
        arr.append(String(w * h))
        switch c {
            case "C":
                return arr.joined(separator: "\n")
            default:
                break
        }
    }
}


let answer = solution()

print(answer)