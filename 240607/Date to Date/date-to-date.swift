import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

let DAYS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

let STACK_DAYS = {
    var Days = [0]
    for i in (1..<DAYS.count){
        var stack = 0
        for j in (0..<i) {
            stack += DAYS[j]
        }
        Days.append(stack)
    }
    return Days
}()

func readABCD() -> (Int, Int, Int, Int)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != 4 || temp.count != nums.count {
        return nil
    }
    return (nums[0], nums[1], nums[2], nums[3])
}

func getDateCount(month: Int, day: Int) -> Int {
    return month == 1 ? day : STACK_DAYS[month - 1] + day
}

func solution(component: (Int, Int, Int, Int)) -> Int {
    let (a, b, c, d) = component
    return getDateCount(month: c, day: d) - getDateCount(month: a, day: b) + 1
}


func main() {
    guard let input = readABCD() else { return }
    print(input |> solution)
}

main()