import Foundation

let n = Int(readLine()!)!

func generateStarPattern(_ n : Int) -> String {
    return Array(repeating: "*", count: n).joined(separator: " ")
}

func solution(_ n : Int) -> String {
    let w = n * 2 - 1
    return ((1...n) + (1...n - 1).reversed()).map{
        let starPattern = generateStarPattern($0)
        let spaceLen = (w - starPattern.count) / 2

        return String(repeating: " ", count: spaceLen) + starPattern + String(repeating: " ", count: spaceLen)
    }.joined(separator: "\n")

}

let answer = solution(n)

print(answer)