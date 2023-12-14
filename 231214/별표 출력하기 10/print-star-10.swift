import Foundation

let n = Int(readLine()!)!

func generateStarPattern(_ n : Int) -> String {
    return Array(repeating: "*", count: n).joined(separator: " ")
}

func solution(_ n : Int) -> String {
    return (1...n).reduce(""){
        (acc: String, cur: Int) -> String in
        return (acc.count == 0 ? "" : acc + "\n") + generateStarPattern(cur) + "\n" + generateStarPattern(n - cur + 1)
    }
}

let answer = solution(n)

print(answer)