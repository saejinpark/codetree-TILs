import Foundation

let n = Int(readLine()!)!

let isIntact = {$0 % 2 != 0 && $0 % 10 != 5 && !($0 % 3 == 0 && $0 % 9 != 0)}

func solution(_ n : Int) -> String {
    return (1...n).filter{isIntact($0)}.map{String($0)}.joined(separator: " ")
}


let answer = solution(n)

print(answer)