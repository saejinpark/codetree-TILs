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

func solution(input: (Int, Int)) -> String {
    let (a, b) = input
    if a > b {
        return "\(a + 25) \(b * 2)"
    }
    return "\(a * 2) \(b + 25)"
}

func main() {
    guard let nums = readNums() else { return }
    if nums.count != 2 { return }
    let (num1, num2) = (nums[0], nums[1])
    print((num1, num2) |> solution)
}

main()