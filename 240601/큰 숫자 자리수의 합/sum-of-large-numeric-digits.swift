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

func multi(nums: [Int], stack: Int = 1) -> Int {
    if nums.count == 0 { return stack }
    var temp = nums
    let current = temp.remove(at: 0)
    return multi(nums: temp, stack: stack * current)
}

func sum(nums: [Int], stack: Int = 0) -> Int {
    if nums.count == 0 { return stack }
    var temp = nums
    let current = temp.remove(at: 0)
    return sum(nums: temp, stack: stack + current)
}

func solution(nums: [Int]) -> Int {
    let multiNum = multi(nums: nums)
    return sum(
                nums: String(multiNum)
                    .split(separator: "")
                    .compactMap({Int($0)})
            )
}

func main() {
    guard let nums  = readNums() else { return }
    print(nums |> solution)
}

main()