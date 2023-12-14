import Foundation

let n = Int(readLine()!)!

func generateStarPattern(_ n : Int) -> String {
    return Array(repeating: "*", count: n).joined(separator: " ")
}

func solution(_ n : Int) -> String {
    return (1...n).reduce(""){($0.count == 0 ? "" : $0 + "\n") + generateStarPattern($1) + "\n" + generateStarPattern(n - $1 + 1)}
}

let answer = solution(n)

print(answer)