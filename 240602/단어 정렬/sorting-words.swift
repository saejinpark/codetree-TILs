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

func solution(lines: [String]) -> String {
    return lines.sorted().joined(separator: "\n")
}

func main() {
    guard let n = readNum() else { return }
    let lines = (1...n).compactMap({_ in readLine()})
    if n != lines.count { return }
    print(lines |> solution)
}

main()