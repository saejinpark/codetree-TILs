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
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func solution(nums: [Int]) -> Int {
    guard let minNum = nums.min() else { return -1 }
    return minNum
}

func main() {
    guard let nums = readNums() else { return }
    print(nums |> solution)
}

main()