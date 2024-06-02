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

func readNK() -> (Int, Int)? {
    guard let nums = readNums() else { return nil }
    if nums.count != 2 { return nil }
    return (nums[0], nums[1])
}

func solution(component: (Int, Int, [Int])) -> Int {
    let (n, k, nums) = component
    return nums.sorted()[k - 1]
}

func main() {
    guard let (n, k) = readNK(), let nums = readNums() else { return }
    if n != nums.count { return }
    print((n, k, nums) |> solution)
}

main()