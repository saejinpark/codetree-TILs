import Foundation

let n = Int(readLine()!)!

func _solution(_ n : Int) -> String {
    if n == 0 {
        return ""
    }
    return Array(repeating: String(repeating: "*", count: n), count: n).joined(separator: " ")
}

func solution(_ n : Int ) -> String {
    return (1...n).map{_solution(n - $0 + 1)}.joined(separator: "\n")
}

let answer = solution(n)

print(answer)