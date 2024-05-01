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
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func solution(_ nums:[Int]) -> Int {
    var maxNum = nums[0]
    for i in 1..<nums.count {
        let num = nums[i]
        maxNum = max(maxNum, num)
    }
    return maxNum
}

func main() {
    if let nums = readNums() {
        print(solution(nums))
    }
}

main()