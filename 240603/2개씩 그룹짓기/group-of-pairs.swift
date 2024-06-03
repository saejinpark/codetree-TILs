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

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func solution(nums: [Int]) -> Int {
    let sortedNums = nums.sorted()
    var groupMax = 0

    for i in stride(from: 0, to: nums.count, by: 1) {
        let groupSum = sortedNums[i] + sortedNums[nums.count - 1 - i]
        if groupSum > groupMax {
            groupMax = groupSum
        }
    }

    return groupMax
}

func main() {
    guard let n = readNum(), let nums = readNums() else { return }
    if nums.count != 2 * n { return }
    print(nums |> solution)
}

main()