import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func solution(bit: String) -> String {
    guard let num = Int(bit, radix: 2) else { return "Fail"}
    return String(num * 17, radix: 2)
}

func main() {
    guard let bit = readLine() else { return }
    print(bit |> solution)
}

main()