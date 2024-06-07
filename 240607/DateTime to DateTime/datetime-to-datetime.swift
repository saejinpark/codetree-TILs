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

func getMinute(day: Int, hour: Int, minute: Int) -> Int {
    return (day * 24 * 60) + (hour * 60) + minute
}

func solution(input: (Int, Int, Int)) -> Int {
    let (day, hour, minute) = input
    return getMinute(day: day, hour: hour, minute: minute) - getMinute(day: 11, hour: 11, minute: 11)
}

func main() {
    guard let input = readDayMonthDay() else { return }
    print(input |> solution)
}

main()