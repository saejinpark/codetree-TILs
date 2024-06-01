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
    if n == 1 { return 2 }
    if n == 2 { return 4 }
    return (solution(n: n - 2) * solution(n: n - 1)) % 100
}

func main() {
    guard let n = readNum() else { return }
    print(solution(n: n))
}

main()