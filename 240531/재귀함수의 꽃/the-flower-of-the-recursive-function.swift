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

func solution(stack: String = "", count: Int) -> String {
    let midIndex = stack.index(stack.startIndex, offsetBy: stack.count / 2)
    let front = String(stack[..<midIndex])
    let back = String(stack[midIndex...])
    if count == 0 {
        return "\(front) \(back)"
    }
    if stack == "" {
        return solution(stack: "\(count)\(count)", count: count - 1)
    }
    return solution(stack: front + " \(count)\(count) " + back, count: count - 1)
}

func main() {
    guard let num = readNum() else { return }
    print(solution(count: num))

}

main()