import Foundation

let n = Int(readLine()!)!

func solution(_ n: Int) -> Bool{
    return (1..<n).filter{n % $0 == 0}.reduce(0, +) == n
}

let answer = solution(n)

print(answer ? "P" : "N")