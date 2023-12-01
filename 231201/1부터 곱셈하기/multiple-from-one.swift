import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var mul = 1
    for i in 1...10 {
        mul *= i
        if mul >= n {
            return i
        }
    }
    return -1
}

let answer = solution(n)

print(answer)