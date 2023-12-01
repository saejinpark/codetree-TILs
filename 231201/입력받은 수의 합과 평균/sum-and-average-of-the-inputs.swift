import Foundation

let n = Int(readLine()!)!

let nums = (1...n).map{_ in Int(readLine()!.trimmingCharacters(in: .whitespaces))!}
let sum = {(nums: [Int]) -> Int in nums.reduce(0, +)}
let avg = {(nums: [Int]) -> Float in round(Float(sum(nums)) / Float(nums.count) * 10) / 10}

func solution(_ nums: [Int]) -> String {
    return "\(sum(nums)) \(avg(nums))"
}

let answer = solution(nums)

print(answer)