import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

public func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let (a, b) = readLine()!.split(separator: " ").map{Int($0)!} |> {($0[0], $0[1])}

func check(_ n : Int) -> Bool {
    return n != 0 && n % 5 == 0 || n % 7 == 0
}

func sum(_ nums: [Int]) -> Int {
    return nums.reduce(0){$0 + $1}
}

func avg(_ nums: [Int]) -> Float {
    return round((Float(sum(nums)) / Float(nums.count)) * 10) / 10
}

func solution(_ a: Int, _ b: Int) -> String {
    let nums = (a...b).filter{check($0)}
    return "\(sum(nums)) \(avg(nums))"
}

var answer = solution(a, b)

print(answer)