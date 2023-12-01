import Foundation

let a = Int(readLine()!)!

let isValid = {(($0 % 2 == 0) && $0 % 4 != 0) || ($0 / 8) % 2 == 0 || $0 % 7 < 4}

func solution(_ a : Int) -> String {
    return (1...a).filter{!isValid($0)}.map{String($0)}.joined(separator: " ")
}

let answer = solution(a)

print(answer)