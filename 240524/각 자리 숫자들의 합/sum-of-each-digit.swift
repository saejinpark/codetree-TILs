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
    let temp = Array(line).map(String.init)
    let nums = temp.compactMap({ Int($0) })
    if temp.count != nums.count { return nil }
    return nums
}

let solution = {(nums: [Int]) -> Int in nums.reduce(0, +) }

func main() {
    guard let nums = readNums() else { return }
    print(nums |> solution)
}

main()