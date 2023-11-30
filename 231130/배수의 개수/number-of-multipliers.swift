import Foundation

let nums = (0...9).map{_ in Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!}

func solution(_ nums : [Int]) -> String {
    let noZeroNums = nums.filter{$0 != 0}
    return "\(noZeroNums.filter{$0 % 3 == 0}.count) \(noZeroNums.filter{$0 % 5 == 0}.count)"
}

let answer = solution(nums)

print(answer)