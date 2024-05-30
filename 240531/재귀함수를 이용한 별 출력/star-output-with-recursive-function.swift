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

func solution(num: Int) -> String {
    return num == 1 ? "*" : "\(solution(num: num - 1))\n\(String(repeating: "*", count: num))"
}

func main() {
    guard let n = readNum() else { return }
    print(n |> solution)
}

main()