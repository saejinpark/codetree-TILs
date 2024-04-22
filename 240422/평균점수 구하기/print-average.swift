import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value: T, function: (T) -> U) -> U {
    return function(value)
}

func readFloats() -> [Float]? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    let floats = temp.compactMap({Float($0)})
    if temp.count != floats.count {
        return nil
    }
    return floats
}

func solution(_ scores: [Float]) -> String {
    return "\(String(format: "%0.1f", round(scores.reduce(0.0, +) * 10 / Float(scores.count)) / 10))"
}

func main() {
    if let scores = readFloats() {
        print(solution(scores))
    }
}

main()