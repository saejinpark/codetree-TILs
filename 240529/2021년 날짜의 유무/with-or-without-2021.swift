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

func solution(input: (Int, Int)) -> String {
    let (m, d) = input
    if m < 1 || m >= DAYS.count { return "No" }
    if d < 1 || d > DAYS[m - 1] { return "No" }
    return "Yes"
}

func main() {
    guard let md = readNums() else { return }
    let (m, d) = (md[0], md[1])
    print((m, d) |> solution)
}

main()