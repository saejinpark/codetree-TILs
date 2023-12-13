import Foundation

let n = Int(readLine()!)!

func solution(_ n : Int) -> String {
    return Array(repeating: String(repeating: "*", count: n), count: n).joined(separator: "\n")
}

let answer = solution(n)

print(answer)