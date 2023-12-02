import Foundation

var n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    
    var cur = Int(n)
    var temp = 0
    for i in 1...n {
        cur = cur / i
        temp = i
        if cur <= 1 {
            break
        }
    }

    return temp
}

let answer = solution(n)

print(answer)