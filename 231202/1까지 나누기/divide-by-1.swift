import Foundation

var n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    
    var temp = Float(n)
    var i = 0
    
    while temp > 1 {
        i += 1
        temp = temp / Float(i)
    }

    return i
}

let answer = solution(n)

print(answer)