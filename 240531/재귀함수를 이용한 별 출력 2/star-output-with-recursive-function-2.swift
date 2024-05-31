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

func solution(stack: [String] = [], count: Int) -> String {
    let str = Array(repeating: "*", count: count).joined(separator: " ")
    if count == 0 {
        return stack.joined(separator: "\n")
    }
    if stack.count ==  0 {
        return solution(stack: [str, str], count: count - 1)
    }
    let midIndex = stack.count / 2
    let front = stack[..<midIndex]
    let end = stack[midIndex...]

    return solution(stack: front + [str, str] + end, count: count - 1)

}

func main() {
    guard let n = readNum() else { return }
    print(solution(count: n))
}

main()