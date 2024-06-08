import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let DAYS = [
    31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
]

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

let DAY_OF_WEEKS = [
    "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"
]

let DAY_DICT = {
    var dict: [String: Int] = [:]
    for i in 0..<DAY_OF_WEEKS.count {
        dict[DAY_OF_WEEKS[i]] = i
    }
    return dict
}()

func readInput() -> (Int, Int, Int, Int)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if nums.count != 4 { return nil }
    return (nums[0], nums[1], nums[2], nums[3])
}

func getDays(month: Int, day: Int) -> Int {
    return STACK_DAYS[month - 1] + day
}

func getConstant(count: Int, day: String) -> Int {
    return ((7 + (DAY_DICT[day] ?? 1)) - (count % 7)) % 7
}

func solution(input: (Int, Int, Int, Int), day: String) -> Int {
    let (m1, d1, m2, d2) = input
    let start = getDays(month: m1, day: d1)
    let constant = getConstant(count: start, day: day)
    let end = getDays(month: m2, day: d2)
    var count = 0
    for i in start..<end {
        let currentDay = DAY_OF_WEEKS[(i + constant) % 7]
        if currentDay == day {
            count += 1
        }
    }
    return count
}

func main() {
    guard let input = readInput(), let day = readLine() else { return }
    print(solution(input: input, day: day))
}

main()