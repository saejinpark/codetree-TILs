import Foundation

let n = Int(readLine()!)!

func solution(_ n : Int) -> String {
    return (1...n).map{(_ n : Int) -> String in n % 2 == 1 ? "*" : Array(repeating: "*", count: n).joined(separator: " ")}.joined(separator: "\n")
}

let answer = solution(n)

print(answer)