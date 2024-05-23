import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func solution(str: String) -> Int{
    return Array(str).map(String.init).compactMap(Int.init).reduce(0, +)
}

func main() {
    if let line = readLine() {
        print(line |> solution)
    }
}

main()