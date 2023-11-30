import Foundation

var input = (0...9).map{_ in readLine()!}.map{Int($0)!}

func solution(_ nums: [Int]) -> Int {
    return nums.filter{$0 % 2 == 1}.count
}

let answer = solution(input)

print(answer)