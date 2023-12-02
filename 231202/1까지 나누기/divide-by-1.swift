import Foundation

var n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    
    var cur = Float(n)
    var temp = 0
    for i in 1...n {
        cur = cur / Float(i)
        temp = i
        if cur <= 1 {
            break
        }
    }

    return temp
}

let answer = solution(n)

print(answer)