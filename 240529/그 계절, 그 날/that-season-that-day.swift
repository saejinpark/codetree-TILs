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

let DAYS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let LEAP_YEAR_DAYS = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

func isLeapYear(year: Int) -> Bool {
    if year % 4 != 0 { return false }
    if year % 100 != 0 { return true }
    if year % 400 == 0 { return true }
    return false
}

func solution(input: (Int, Int, Int)) -> String {
    let (year, month, day) = input
    let days = (year |> isLeapYear) ? LEAP_YEAR_DAYS : DAYS
    if day > days[month - 1] { return "-1"}

    switch month {
    case 1...2:
        return "Winter"
    case 3...5:
        return "Spring"
    case 6...8:
        return "Summer" 
    case 9...11:
        return "Fall"
    case 12:
        return "Winter"
    default:
        return "-1"
    }
}

func main() {
    guard let nums = readNums() else { return }
    if nums.count != 3 { return }
    let input = (nums[0], nums[1], nums[2])
    print(input |> solution)
}

main()