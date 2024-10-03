import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ").map(String.init)
    let nums = temp.compactMap{ Int($0) }
    return temp.count == nums.count ? nums : nil
}

func solution(nums: [Int]) -> Int {
    var sum = nums.reduce(0, +)
    var minDifference = Int.max

    for i in 0...3 {
        for j in (i + 1)...4 {
            let sum1 = nums[i] + nums[j]
            let sum2 = nums[4 - i] + nums[4 - j]
            let sum3 = sum - sum1 - sum2

            if sum1 != sum2 && sum2 != sum3 && sum1 != sum3 {
                let maxSum = [sum1, sum2, sum3].max()!
                let minSum = [sum1, sum2, sum3].min()!
                let difference = maxSum - minSum

                minDifference = [minDifference, difference].min()!
            }
        }
    }

    if minDifference == Int.max {
        return -1
    }

    return minDifference
}

func main() {
    guard let nums = readNums() else { return }
    print(solution(nums: nums))
}

main()