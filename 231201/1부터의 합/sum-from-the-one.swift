import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var sum = 0
    for i in 1...100 {
        sum += i
        if sum >= n {
            return i
        }
    }
    return -1
}

let answer = solution(n)

print(answer)