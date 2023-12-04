import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var cnt = 0
    var cur = n
    while true {
        switch cur {
            case 1:
                return cnt
            default:
                cnt += 1
                cur = cur % 2 == 0 ? cur / 2 : cur * 3 + 1
                break
        }
    }

    return cnt
}

let answer = solution(n)

print(answer)