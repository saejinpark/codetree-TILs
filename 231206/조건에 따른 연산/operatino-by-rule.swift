import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var cnt = 0
    var cur = n
    while cur < 1000 {
        cnt += 1
        cur = cur % 2 == 0 ? cur * 3 + 1 : cur * 2 + 2
    }

    return cnt
}


let answer = solution(n)

print(answer)