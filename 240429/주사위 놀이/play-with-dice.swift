import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    return temp.count == nums.count ? nums : nil
}

func formatDiceScore(result:[Int]) -> String {
    return result.enumerated()
            .map{(index, element) in "\(index + 1) - \(element)" }
            .joined(separator: "\n")
}

func solution(_ nums:[Int]) -> String {
    var diceScore = Array(repeating: 0, count: 6)
    nums.forEach{ diceScore[$0 - 1] += 1 }
    return diceScore |> formatDiceScore
}

func main() {
    if let nums = readNums() {
        print(solution(nums))
    }
}

main()