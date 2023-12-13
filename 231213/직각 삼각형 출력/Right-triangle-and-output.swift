import Foundation

let n = Int(readLine()!)!

func solution(_ n : Int) -> String {
    return (1...n).map{"*" + String(repeating: "**", count: $0 - 1)}.joined(separator: "\n")
}

let answer = solution(n)

print(answer)