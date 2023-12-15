import Foundation

let n = Int(readLine()!)!

func solution(_ n : Int) -> String {
    return (1...n).map{
        [
            Array(repeating: "*", count: n - $0 + 1).joined(separator: " "),
            Array(repeating: "*", count: $0).joined(separator: " ")
        ].joined(separator: "\n")
    }.joined(separator: "\n")
} 

let answer = solution(n)

print(answer)