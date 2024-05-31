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

func solution(cur: Int, count: Int = 0) -> Int {
    if cur == 1 {
        return count
    }
    return solution(cur: cur % 2 == 0 ? cur / 2 : cur / 3, count: count + 1)
}

func main() {
    guard let n = readNum() else { return }
    print(solution(cur: n))
}

main()