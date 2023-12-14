import Foundation

let n = Int(readLine()!)!

func generateStarPattern(_ n : Int) -> String {
    return Array(repeating: "*", count: n).joined(separator: " ")
}

func generateSpace(_ n : Int) -> String {
    return String(repeating: " ", count: n)
}

func solution(_ n : Int) -> String {
    if n == 1 {
        return "*"
    }
    return ((1...n).reversed() + (2...n)).map{
        let starLen = $0 * 2 - 1
        let spaceLen = n * 2 - 1 - starLen
        return generateSpace(spaceLen) + generateStarPattern(starLen) + generateSpace(spaceLen)
    }.joined(separator: "\n")
}

let answer = solution(n)

print(answer)