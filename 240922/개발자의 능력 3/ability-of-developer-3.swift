import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap{ Int($0) }
    return temp.count == nums.count ? nums : nil
}

func solution(_ nums: [Int]) -> Int {
    var answer = Int.max
    let sum = nums.reduce(0, +)
    for i in 0..<(nums.count - 2) {
        for j in (i + 1)..<(nums.count - 1) {
            for k in (j + 1)..<nums.count {
                let testCase = [i, j, k].map{ nums[$0] }.reduce(0, +)
                answer = [answer, abs(sum - testCase * 2)].min()!
            }
        }
    }
    return answer
}

func main() {
    guard let nums = readNums() else { return }
    print(solution(nums))
}

main()