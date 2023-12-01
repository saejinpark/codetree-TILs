import Foundation

precedencegroup ForwardPipe {associativity: left}
infix operator |> : ForwardPipe
func |> <T, U> (value: T, function: (T) -> U) -> U {return function(value)}

let nums = (1...10).map{_ in readLine()!.trimmingCharacters(in: [" "]) |> {Int($0)!}}
let sum = {(nums: [Int]) -> Int in nums.reduce(0, +)}
let avg = {(nums: [Int]) -> Float in round(Float(sum(nums)) / Float(nums.count) * 10) / 10}

func solution(_ nums : [Int]) -> String {
    let filteredNums = nums.filter{0 <= $0 && $0 <= 200}
    return "\(sum(filteredNums)) \(avg(filteredNums))"
}

let answer = solution(nums)

print(answer)