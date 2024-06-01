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

func solution(nums: [Int], max: Int = Int.min) -> Int {
    if nums.count == 0 {
        return max
    }
    var temp = nums
    guard let nextMax = [max, temp.remove(at: 0)].max() else { return -1 }
    return solution(nums: temp, max: nextMax)
}

func main() {
    guard let n = readNum(), let nums = readNums() else { return }
    if n != nums.count { return }
    print(solution(nums: nums))
}

main()