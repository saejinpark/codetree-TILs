import Foundation

let n = Int(readLine()!)!

func generateSpace(_ n : Int) -> String {
    if n < 1 {
        return ""
    } 
    return String(repeating: "  ", count: n)
}

func generateStarPattern(_ n : Int) -> String {
    if n < 1 {
        return ""
    }
    return Array(repeating: "*", count: n).joined(separator: " ")
}

func solution(_ n : Int) -> String {
    return Array((0...n).reversed()).map{
        let starLen = $0 * 2 - 1
        let spaceLen = (n * 2 - 1 - starLen) / 2
        return generateSpace(spaceLen) + generateStarPattern(starLen) + generateSpace(spaceLen)
    }.joined(separator: "\n")
}

let answer = solution(n)

print(answer)