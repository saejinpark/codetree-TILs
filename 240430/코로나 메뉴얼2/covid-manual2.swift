import Foundation

precedencegroup ForwardPipe {
    associativity: left
}

infix operator |> : ForwardPipe

func |> <T, U> (value:T, function:(T) -> U) -> U {
    return function(value)
}

func readTestResult() -> (String,Int)? {
    guard let line = readLine() else { return nil }
    let temp = line.split(separator: " ")
    if temp.count != 2 { return nil}
    if let temperature = Int(temp[1]) {
        return temp |> { (String($0[0]), temperature) }
    }
    return nil
}

func solution(_ readResults:[(String,Int)]) -> String {
    var counter = Array(repeating: 0, count: 4)
    var cnt = 0
    for (symptom, temperature) in readResults {
        if symptom == "Y" && temperature >= 37 {
            if temperature >= 37 {
                counter[0] += 1
                cnt += 1
            } else {
                counter[2] += 1
            }
        } else {
            if temperature >= 37 {
                counter[1] += 1
            } else {
                counter[3] += 1
            }
        }
    }
    return counter
                .map{ String($0) }
                .joined(separator: " ")
                + "\(cnt >= 2 ? " E" : "")" 
}

func main() {
    let n = 3
    let readResults = (1...n).compactMap({ _ in readTestResult()})
    if readResults.count != 3 {
        return
    }
    print(solution(readResults))
}

main()