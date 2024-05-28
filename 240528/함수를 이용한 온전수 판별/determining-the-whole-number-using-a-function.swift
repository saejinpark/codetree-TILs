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

func isPerfactNum(num: Int) -> Bool {
    if num % 2 == 0 { return false }
    if num % 10 == 5 { return false }
    if num % 3 == 0 && num % 9 != 0 { return false }
    return true
}

func solution(input: (Int, Int)) -> Int {
    let (start, end) = input
    return (start...end).filter(isPerfactNum).count
}

func main() {
    guard let nums = readNums() else { return }
    if nums.count != 2 { return }
    let (num1, num2) = (nums[0], nums[1])
    print((num1, num2) |> solution)
}

main()