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

func solution(n: Int) -> Int {
    if n < 1 { return 0 }
    return ((n - 2) |> solution) + n
}

func main() {
    guard let n = readNum() else { return }
    print(n |> solution)
}

main()