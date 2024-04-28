import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func formatAnswer(nums:[Int]) -> String {
    return nums
            .map{ String($0) }
            .joined(separator: "\n")
}

func solution(_ n:Int, _ nums:[Int]) -> [Int] {
    let result = nums.reduce(into: Array(repeating: 0, count: 9)) { arr, num in
        arr[num - 1] += 1
    }
    return result
}

func main() {
    if let n = readNum(), let nums = readNums() {
        let answer = solution(n, nums)
        print(answer |> formatAnswer)
    }
}

main()