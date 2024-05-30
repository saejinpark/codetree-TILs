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
        return "\(a * 2) \(b + 10)"
    }
    return "\(a + 10) \(b * 2)"
}

func main() {
    guard let nums = readNums() else { return }
    if nums.count != 2 { return }
    let input = (nums[0], nums[1])
    print(input |> solution)
}

main()