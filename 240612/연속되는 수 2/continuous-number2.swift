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

func solution(nums: [Int]) -> Int {
    var maxCount = 1
    var baseLine = -1
    var count = 0
    for testCase in nums {
        if baseLine == -1 || baseLine != testCase {
            baseLine = testCase
            count = 1
            continue
        }
        count += 1
        maxCount = count > maxCount ? count: maxCount
    }

    return maxCount
}

func main() {
    guard let n = readNum() else { return }
    let nums = (1...n).compactMap({_ in readNum()})
    if n != nums.count { return }
    print(nums |> solution)
}

main()