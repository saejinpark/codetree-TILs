import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var cur = n
    var x = 0
    while cur != 1 {
        x += 1
        cur /= 2
    }

    return x
}

let answer = solution(n)


print(answer)