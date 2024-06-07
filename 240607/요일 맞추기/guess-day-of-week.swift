import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readInput() -> (Int, Int, Int, Int)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != 4 || temp.count != nums.count { return nil }
    return (nums[0], nums[1], nums[2], nums[3])
}

let DAYS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

let STACK_DAYS = {
    var arr = [0]
    for i in 1..<DAYS.count {
        var stack = 0
        for j in 0..<i {
            stack += DAYS[j]
        }
        arr.append(stack)
    }
    return arr
}()

let DAY_OF_THE_WEEKS = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

// 371

func getDayCount(month: Int, day: Int) -> Int {
    return STACK_DAYS[month - 1] + day
}

func getDayConstant(month: Int, day: Int) -> Int {
    return (8 - ((371 + STACK_DAYS[month - 1] + day) % 7)) % 7
}

func solution(input: (Int, Int, Int, Int)) -> String {
    let (m1, d1, m2, d2) = input
    let constant = getDayConstant(month: m1, day: d1)
    return DAY_OF_THE_WEEKS[(getDayCount(month: m2, day: d2) + constant) % 7]
}

func main() {
    guard let input = readInput() else { return }
    print(input |> solution)
}

main()