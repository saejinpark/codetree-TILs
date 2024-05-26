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

func solution(n: Int) -> String {
    if n % 2 != 0 { return "No" }
    let posNumSum = String(n).split(separator: "").compactMap({Int($0)}).reduce(0, +)
    if posNumSum % 5 != 0 { return "No" }
    return "Yes"
}

func main() {
    guard let n = readNum() else { return }
    print(n |> solution)
}

main()