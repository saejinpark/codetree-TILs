import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func solution(_ line: String) -> String {
    var temp = line.split(separator: " ")
    temp.reverse()
    return temp.reduce("", +)
}

func main() {
    if let line = readLine() {
        print(solution(line))
    }
}

main()