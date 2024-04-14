import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readStartEnd() -> (Int, Int)? {
    guard let line = readLine() else { return nil }
    let nums = line.split(separator: " ").compactMap({Int($0)})
    guard nums.count == 2 else { return nil }
    guard let start = nums.first, let end = nums.last else { return nil }

    return (start, end)
}

func isThreeDiv(_ number: Int) -> Bool {
    return (1...number).filter{number % $0 == 0}.count == 3
}

func solution(_ start: Int, _ end: Int) -> Int {
    return (start...end).filter{isThreeDiv($0)}.count
}

func main() {
    if let (start, end) = readStartEnd() {
        print(solution(start, end))
    }
}

main()