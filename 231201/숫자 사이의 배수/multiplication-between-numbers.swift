import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

public func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let (a, b) = readLine()!.split(separator: " ").map{Int($0)!} |> {($0[0], $0[1])}

let sum = {(nums: [Int]) -> Int in nums.reduce(0){$0 + $1}}
let avg = {(nums: [Int]) -> Float in round((Float(sum(nums)) / Float(nums.count)) * 10) / 10}

func solution(_ a: Int, _ b: Int) -> String {
    let nums = (a...b).filter{$0 != 0 && $0 % 5 == 0 || $0 % 7 == 0}
    return "\(sum(nums)) \(avg(nums))"
}

var answer = solution(a, b)

print(answer)