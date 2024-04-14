import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readInt() -> Int? {
    guard let line = readLine(), let int = Int(line)
    else {
        return nil
    }

    return int
}

func readTestCase() -> (Int, Int)? {
    guard let line = readLine() else { return nil }
    
    let nums = line.split(separator: " ").compactMap { Int($0) }
    guard nums.count == 2 else { return nil }

    guard let first = nums.first, let second = nums.last else { return nil }

    return (first, second)
}

func solution(_ T: Int, _ arr: [(Int, Int)]) -> String {
    func _solution(_ start: Int, _ end: Int) -> Int {
        return (start...end).reduce(1){$0 * $1}
    }
    return arr
        .map{(start, end) in String(_solution(start, end))}
        .joined(separator: "\n")
}

func main() {
    if let T = readInt() {
        let arr = (1...T).map{_ in readTestCase()!}
        solution(T, arr) |> {print($0)}
    }
}

main()