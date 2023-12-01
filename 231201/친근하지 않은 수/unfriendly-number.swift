import Foundation

let n = Int(readLine()!)!

let isFriendlyNumber = {$0 % 2 == 0 || $0 % 3 == 0 || $0 % 5 == 0}

func solution(_ n : Int) -> Int {
    return (1...n).filter{!isFriendlyNumber($0)}.count
}


let answer = solution(n)

print(answer)