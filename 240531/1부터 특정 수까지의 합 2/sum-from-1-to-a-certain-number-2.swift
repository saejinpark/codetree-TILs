import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func solution(num: Int) -> Int {
    return (1...num).reduce(0, +)
}

func main() {
    guard let num = readNum() else { return }
    print(num |> solution)
}

main()