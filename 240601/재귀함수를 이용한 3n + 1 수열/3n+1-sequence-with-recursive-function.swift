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

func solution(n: Int, count: Int = 0) -> Int {
    if n == 1 { return count }
    return solution(n: n % 2 == 0 ? n / 2 : n * 3 + 1, count: count + 1)
}

func main() {
    guard let n = readNum() else { return }
    print(solution(n: n))
}

main()