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
    if count == 0 {
        return stack.split(separator: "").joined(separator: " ")
    }
    if stack == "" {
        return solution(stack: "\(count)\(count)", count: count - 1)
    }
    let midIndex = stack.index(stack.startIndex, offsetBy: stack.count / 2)

    let front = String(stack[..<midIndex]) + "\(count)"
    let back = "\(count)" + String(stack[midIndex...])
    return solution(stack: front + back, count: count - 1)
}

func main() {
    guard let num = readNum() else { return }
    print(solution(count: 5))

}

main()