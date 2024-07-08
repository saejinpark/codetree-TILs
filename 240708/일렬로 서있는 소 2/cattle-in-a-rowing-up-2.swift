import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func solution(nums: [Int]) -> Int {
    var count = 0
    let limit = nums.count - 1
    for i in 0..<limit {
        for j in (i + 1)..<limit {
            for k in (j + 1)..<limit {
                if nums[i] < nums[j] && nums[j] < nums[k] {
                    count += 1
                }
            }
        }
    }
    return count
}

func main() {
    guard let n = readNum(), let nums = readNums() else { return }
    print(nums |> solution)

}

main()