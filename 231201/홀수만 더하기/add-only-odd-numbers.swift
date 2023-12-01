import Foundation

let n = Int(readLine()!)!

let nums = (1...n).map{_ in return Int(readLine()!)!}

func solution(_ nums : [Int]) -> Int {
    return nums.filter{$0 % 2 == 1 && $0 % 3 == 0}.reduce(0){$0 + $1}
}

let answer = solution(nums)

print(answer)