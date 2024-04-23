import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readNum() -> Int? {
    guard let line = readLine(), let num = Int(line)
    else { return nil }
    return num
}

func readNums() -> [Int]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let nums = temp.compactMap({ Int($0) })
    if temp.count != nums.count {
        return nil
    } 
    return nums
}

func scoreToAvg(_ score: [Int]) -> Float {
    return round(Float(score.reduce(0, +)) / Float(score.count) * 10) / 10
}

func scoresToAvgs(_ scores:[[Int]]) -> [Float] {
    return scores.map{ scoreToAvg($0) }
}

func avgsToResults(_ avgs: [Float] ) -> [Bool] {
    return avgs.map{ $0 > 60.0 }
}

func solution(_ T: Int, _ scores: [[Int]]) -> String {
    let results = scores |> scoresToAvgs |> avgsToResults
    let strResult = results.map{ $0 ? "pass" : "fail" }
    let passCount = results.reduce(0) { $1 ? $0 + 1 : $0 }

    return "\(strResult.joined(separator: "\n"))\n\(passCount)"
}

func main() {
    guard let T = readNum() else { return }
    let scores = (1...T).compactMap({_ in readNums() })
    if T != scores.count { return }
    print(solution(T, scores))

}

main()