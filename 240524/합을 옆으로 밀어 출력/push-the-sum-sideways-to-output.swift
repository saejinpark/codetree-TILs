import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine() else { return nil }
    return Int(line)
}

func shiftStr(str: String) -> String {
    var strArr = Array(str).map(String.init)
    strArr.append(strArr.remove(at: 0))
    return strArr.joined(separator: "")
}

func solution(nums: [Int]) -> String {
    let sum = nums.reduce(0, +)
    let strSum = String(sum)
    return strSum |> shiftStr
}

func main() {
    guard let n = readNum() else { return }
    let nums = (1...n).compactMap({_ in readNum()})
    print(nums |> solution)
}

main()