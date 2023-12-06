import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> String {
    var bool = false

    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 {
            bool = true
            break
        }
    }

    return bool ? "C" : "N"
}

let answer = solution(n)

print(answer)