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
    return nums
}

func solution(component:(Int, [Int])) -> Int {
    let (n, nums) = component
    var answer = 0
    for i in 0..<n {
        let first = nums[i]
        for j in i..<n {
            let second = nums[j]
            let testCase = second - first
            if testCase > answer {
                answer = testCase
            }
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