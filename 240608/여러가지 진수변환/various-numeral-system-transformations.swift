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

func solution(input: (Int, Int)) -> String {
    let (n, b) = input
    return String(n, radix: b)
}

func main() {
    guard let nums = readNums() else { return }
    if nums.count != 2 { return }
    let input = nums |> {($0[0], $0[1])}
    print(input |> solution)
}

main()