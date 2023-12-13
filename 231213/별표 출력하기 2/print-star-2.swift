import Foundation

let n = Int(readLine()!)!


func solution(_ n : Int) -> String {
    return Array(1...n).map{Array(repeating: "*", count: n - $0 + 1).joined(separator: " ")}.joined(separator: "\n")
}

let answer = solution(n)

print(answer)