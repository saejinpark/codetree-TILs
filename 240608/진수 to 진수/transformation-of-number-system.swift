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
    if nums.count != temp.count { return nil }
    return nums
}

func readNum() -> Int? {
    guard let line = readLine(),
    let num = Int(line)
    else { return nil }
    return num
}

func solution(input: (Int, Int, Int)) -> String {
    let (a, b, n) = input
    guard let num = Int(String(n), radix: a)
    else { return "fail" }
    return String(num, radix: b)
}

func main() {
    guard let nums = readNums(), let n = readNum() else { return }
    let (a, b) = nums |> {($0[0], $0[1])}
    print((a, b, n) |> solution)
}

main()