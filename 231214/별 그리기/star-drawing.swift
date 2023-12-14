import Foundation

let n = Int(readLine()!)!

func generateSpace(_ n : Int) -> String {
    return String(repeating: " ", count: n)
}

func generateStarPattern(_ n : Int) -> String {
    return String(repeating: "*", count: n)
}

func solution(_ n : Int) -> String {
    if n == 1 {
        return "*"
    }
    return ((1...n) + (1...n - 1).reversed()).map{
        let starLen = $0 * 2 - 1
        let spaceLen = (n * 2 - 1 - starLen) / 2
        return generateSpace(spaceLen) + generateStarPattern(starLen) + generateSpace(spaceLen)
    }.joined(separator: "\n")
}

let answer = solution(n)

print(answer)