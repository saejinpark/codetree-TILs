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

func solution1(num: Int) -> String {
    return num == 1 ? "\(num)" : "\(solution1(num: num - 1)) \(num)"
}

func solution2(num: Int) -> String {
    return num == 1 ? "\(num)" : "\(num) \(solution2(num: num - 1))"
}

func main() {
    guard let num = readNum() else { return }
    print(num |> solution1)
    print(num |> solution2)
}

main()