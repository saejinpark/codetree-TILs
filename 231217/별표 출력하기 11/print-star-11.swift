import Foundation

let n = Int(readLine()!)!


func solution(_ n : Int) -> String {
    let line = Array(repeating: "*", count: 1 + 2 * n).joined(separator: " ")
    let dot = Array(repeating: "*", count: 1 + n).joined(separator: "   ")
    return line + "\n" + (1...2 * n).map{$0 % 2 == 1 ? dot : line}.joined(separator: "\n")    
}

let answer = solution(n)

print(answer)