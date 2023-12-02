import Foundation

var n = Int(readLine()!)!

func solution(n: Int) -> Int {
    var answer = -1
    var temp = Float(n)
    for i in 1...n {
        temp = temp / Float(i)
        answer = i
        if temp <= 1 {
            break
        }
    }

    return answer
}

let answer = solution(n)

print(answer)