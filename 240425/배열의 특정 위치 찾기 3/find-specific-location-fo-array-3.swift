import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func findZeroIndex(_ nums: [Int]) -> Int {
    for i in 0..<nums.count {
        if nums[i] == 0{
            return i
        }
    }
    return -1
}

func solution(_ nums:[Int]) -> Int {
    let baseLine = nums |> findZeroIndex
    return nums[baseLine - 3] + nums[baseLine - 2] + nums[baseLine - 1]
}

func main() {
    if let nums = readNums() {
        print(solution(nums))
    }
}

main()