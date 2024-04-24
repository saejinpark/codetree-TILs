import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T)  -> U) -> U {
    return function(value)
}

func readInt() -> Int? {
    guard let line = readLine(), let num = Int(line) else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({Int($0)})
    if temp.count != nums.count {
        return nil
    }
    return nums
}

func solution(_ n: Int, _ nums: [Int]) -> String {
    return nums.filter{ $0 % 2 == 0 }.reversed().map{ String($0) }.joined(separator: " ")
}

func main() {
    if let n = readInt(), let nums = readNums() {
        print(solution(n, nums))
    }
}

main()