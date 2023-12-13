import Foundation

let n = Int(readLine()!)!

func genSquare(_ n : Int) -> String {
    return Array(repeating: String(repeating: "*", count: n), count: n).joined(separator: "\n")
}

func solution(_ n : Int) -> String {
    return Array(repeating: genSquare(n), count: 2).joined(separator: "\n\n")
}

let answer = solution(n)

print(answer)