import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readDayMonthDay() -> (Int, Int, Int)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if  nums.count != 3 || temp.count != nums.count { return nil }
    return (nums[0], nums[1], nums[2])
}

func getMinute(input: (Int, Int, Int)) -> Int {
    let (day, hour, minute) = input
    return (day * 24 * 60) + (hour * 60) + minute
}

func solution(input: (Int, Int, Int)) -> Int {
    let start = (11, 11, 11) |> getMinute
    let end = input |> getMinute
    return start <= end ? end - start : -1
}

func main() {
    guard let input = readDayMonthDay() else { return }
    print(input |> solution)
}

main()