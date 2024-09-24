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
    let temp = line.split(separator: " ").map(String.init)
    let nums = temp.compactMap{Int($0)}
    return nums
}

func solution(_ nums: [Int]) -> Int {
    let sortedNums = nums.sorted(by:{ $0 < $1 })
    var sums = [Int]()

    for i in 1...nums.count / 2 {
        let sum = sortedNums[i - 1] + sortedNums[sortedNums.count - i - 1]
        sums.append(sum)
    }

    return abs(sums.min()! - sums.max()!)
}

func main() {
    guard let nums = readNums() else { return }
    print(solution(nums))
}

main()