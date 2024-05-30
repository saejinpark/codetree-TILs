import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func solution(str: String) -> String {
    return Set(Array(str)).count >= 2 ? "Yes" : "No"
}

func main() {
    guard let line = readLine() else { return }
    print(line |> solution)
}

main()