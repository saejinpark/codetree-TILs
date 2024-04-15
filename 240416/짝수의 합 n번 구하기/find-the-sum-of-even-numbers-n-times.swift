import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |>: ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readInt() -> Int? {
    guard let line = readLine(), let result = Int(line) else {
        return nil
    }
    return result
}

func readTestCase() -> (Int, Int)? {
    guard let line = readLine() else {
        return nil
    }
    let nums = line
        .split(separator: " ")
        .filter { $0.allSatisfy { $0.isNumber } }
    if nums.count != 2 {
        return nil
    }

    return nums.map { Int($0)! } |> { ($0[0], $0[1]) }
}

func solution(T: Int, arr: [(Int, Int)]) -> String {
    return arr.map{(start, end) in
        var sum = 0
        (start...end).forEach{num in
            if num % 2 == 0 {
                sum += num
            }
        }
        return String(sum)
    }.joined(separator: "\n")
}

func main() {
    guard let T = readInt() else {
        return
    }
    var arr: [(Int, Int)] = []
    for _ in 1...T {
        if let testCase = readTestCase() {
            arr.append(testCase)
        } else {
            return
        }
    }
    
    print(solution(T: T, arr: arr))
}

main()