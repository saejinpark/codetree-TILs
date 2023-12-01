import Foundation

let nums = (1...5).map{_ in return Int(readLine()!)!}

func solution(_ nums: [Int]) -> Int {
    return nums.filter{$0 % 2 == 0}.count 
}

let answer = solution(nums)

print(answer)