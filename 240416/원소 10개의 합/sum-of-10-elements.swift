import Foundation

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let nums = line.split(separator: " ").compactMap{Int($0)}
    return nums.isEmpty ? nil : nums
}

func solution(_ nums: [Int]) -> Int {
    return nums.reduce(0, +)
}

func main() {
    if let nums = readNums() {
        print(solution(nums))
    }
}

main()