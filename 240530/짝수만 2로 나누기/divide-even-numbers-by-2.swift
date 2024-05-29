import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line) else {return nil}
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count { return nil }
    return nums
}

func solution(nums:[Int]) -> String {
    return nums.map{$0 % 2 == 0 ? String($0 / 2): String($0)}.joined(separator: " ")
}

func main() {
    guard let num = readNum() else { return }
    guard let nums = readNums() else { return }
    if nums.count != num { return }
    print(nums |> solution)
}

main()