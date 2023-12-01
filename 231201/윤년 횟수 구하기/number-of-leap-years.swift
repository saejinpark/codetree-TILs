import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    return (1...n).filter{$0 % 4 == 0 && ($0 % 100 != 0 || $0 % 400 == 0)}.count
}

let answer = solution(n)

print(answer)