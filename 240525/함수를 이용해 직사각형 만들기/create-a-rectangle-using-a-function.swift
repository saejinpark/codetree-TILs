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
    let nums = temp.compactMap({ Int($0) })
    if temp.count != nums.count { return nil }
    return nums
}

func solution(input: (Int, Int)) -> String {
    let (n, m) = input
   return Array(repeating: String(repeating: "1", count: m), count: n).joined(separator: "\n")
}

func main() {
    guard let nums = readNums() else { return }
    if nums.count != 2 { return }
    let (n, m) = nums |> {($0[0], $0[1])}
    print((n, m) |> solution)
}

main()