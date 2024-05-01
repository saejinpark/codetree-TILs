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
    let nums = temp.compactMap({Int($0)})
    return temp.count == nums.count ? nums : nil
}

func solution(_ container:(Int, [Int])) -> String {
    let (n, nums) = container
    let minNum = nums[1..<nums.count].reduce(nums[0]){ min($0, $1) }
    let minNumCount = nums.reduce(0){ $1 == minNum ? $0 + 1: $0 }
    return "\(minNum) \(minNumCount)"
}

func main() {
    if let n = readNum(), let nums = readNums() {
        print((n, nums) |> solution)
    }
}

main()