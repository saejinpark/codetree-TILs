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
    var max1 = Int.min
    var max2 = Int.min

    for i in stride(from: 0, to: nums.count, by: 2) {
        let testCase = nums[i] + nums[i + 1]
        max1 = max1 > testCase ? max1 : testCase
    }

    for i in stride(from: 1, to: nums.count + 1, by: 2) {
        let testCase = nums[i] + nums[(i + 1) % nums.count]
        max2 = max2 > testCase ? max2 : testCase
    }

    return max1 < max2 ? max1 : max2
}

func main() {
    guard let n = readNum(), let nums = readNums() else { return }
    if nums.count != 2 * n { return }
    print(nums |> solution)
}

main()