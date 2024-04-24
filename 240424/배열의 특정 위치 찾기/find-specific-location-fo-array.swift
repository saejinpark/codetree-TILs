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
    let nums = temp.compactMap { Int($0) }
    return temp.count == nums.count ? nums : nil
}

func sumFunc(nums: [Int]) -> Int {
    return nums.reduce(0, +)
}

func avgFunc(nums: [Int]) -> Float {
    return round(Float(nums |> sumFunc) / Float(nums.count) * 10) / 10
}

func oddIndexFilter(nums: [Int]) -> [Int] {
    return nums.enumerated().filter{(index, _) in index % 2 == 1}.map{(index, element) in element}
}

func threeMultiIndexFilter(nums: [Int]) -> [Int] {
    return nums.enumerated().filter{(index, _) in (index + 1) % 3 == 0}.map{(index, element) in element}
}

func solution(_ nums: [Int]) -> String {
    return "\( nums |> oddIndexFilter |> sumFunc ) \( nums |> threeMultiIndexFilter |> avgFunc)"
}

func main() {
    if let nums = readNums() {
        print(solution(nums))
    }
}

main()