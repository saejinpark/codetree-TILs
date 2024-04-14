import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func isPerfectNumber(_ n: Int) -> Bool {
    return (1..<n).filter{n % $0 == 0}.reduce(0){$0 + $1} == n
}

func readStartEnd() -> (Int, Int)? {
    guard let line = readLine() else { return nil }
    let nums = line.split(separator: " ").compactMap({Int($0)})
    guard nums.count == 2 else { return nil }
    guard let first = nums.first, let second = nums.last else { return nil }
    return (first, second)
}

func solution(_ start: Int, _ end: Int) -> Int {
    return (start...end).filter{ $0 |> isPerfectNumber }.count
}

func main() {
    if let (start, end) = readStartEnd() {
        solution(start, end) |> {print($0)}
    }
}

main()