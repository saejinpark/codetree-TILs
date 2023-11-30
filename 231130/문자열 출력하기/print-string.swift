import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> String {
    return (1...n).map{_ in return "LeebrosCode"}.joined(separator: "\n")
}

print(solution(n))