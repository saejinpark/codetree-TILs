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

func countFormat(scoreRangeDict:[Int:Int]) -> String {
    return Array(scoreRangeDict)
                .sorted(by: { (pair1, pair2) in pair1.0 > pair2.0 })
                .map{ range, count in "\(range) - \(count)"}
                .joined(separator: "\n")
}

func scoreToScoreRange(num:Int) -> Int {
    switch num {
        case 0...9: return 0
        case 10...19: return 10
        case 20...29: return 20
        case 30...39: return 30
        case 40...49: return 40
        case 50...59: return 50
        case 60...69: return 60
        case 70...79: return 70
        case 80...89: return 80
        case 90...99: return 90
        case 100: return 100
        default: return 0
    }
}

func countScoreRange(scores:[Int]) -> [Int:Int] {
    var scoreRangeDict:[Int:Int] = [:]
    for scoreRange in stride(from: 100, to: 0, by: -10) {
        scoreRangeDict[scoreRange] = 0
    }
    for score in scores {
        if score == 0 { break }
        let currentScoreRange = score |> scoreToScoreRange
        if currentScoreRange == 0 && score != 0 { continue }
        scoreRangeDict[currentScoreRange, default: 0] += 1
    }
    return scoreRangeDict

}

func solution(_ scores:[Int]) -> String {
    return scores |> countScoreRange |> countFormat
}

func main() {
    if let scores = readNums() {
        print(solution(scores))
    }
}

main()