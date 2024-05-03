import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line)
    else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func solution(component:(Int, [Int])) -> Int {
    let (n, nums) = component
    var answer = nums[1] - nums[0]
    for i in 2..<n {
        let testCase = nums[i] - nums[i - 1]
        if testCase < answer {
            answer = testCase
        }
    }
    return answer
}

func main() {
    if let n = readNum(), let nums = readNums() {
        print((n, nums) |> solution)
    }
}

main()