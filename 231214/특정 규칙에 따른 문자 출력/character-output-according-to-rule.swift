import Foundation

let n = Int(readLine()!)!

func solution(_ n : Int) -> String {
    if n == 1 {
        return "*"
    }
    return ((1...n).map{
        (Array(repeating: " ", count: n - $0) + Array(repeating: "@", count: $0)).joined(separator: " ")
    } + (1...n - 1).reversed().map{
        (Array(repeating: "@", count: $0) + Array(repeating: " ", count: n - $0)).joined(separator: " ")
    }).joined(separator: "\n")
}

let answer = solution(n)

print(answer)