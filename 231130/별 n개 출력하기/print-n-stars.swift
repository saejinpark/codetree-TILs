import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> String {
    var i = 0
    var arr = [String]()
    while i < n {
        arr.append("*")
        i += 1
    } 
    return arr.joined(separator: "\n")
}

print(solution(n))