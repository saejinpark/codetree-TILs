import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func solution(bit: String) -> Int {
    guard let num = Int(bit, radix: 2) else { return -1 }
    return num
}

func main() {
    guard let bit = readLine() else { return }
    print(bit |> solution)
}

main()