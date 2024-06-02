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
    if temp.count != nums.count { return nil }
    return nums
}

func numsToLine(nums: [Int]) -> String {
    return nums.map(String.init).joined(separator: " ")
}

func solution(nums: [Int]) -> String {
    let sortedNums = nums.sorted()
    return "\(sortedNums |> numsToLine)\n\((sortedNums.reversed() |> numsToLine))"
}

func main() {
    guard let n = readNum(), let nums = readNums() else { return }
    if n != nums.count { return }
    print(nums |> solution)
}

main()