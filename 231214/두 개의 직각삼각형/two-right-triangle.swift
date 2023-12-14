import Foundation

let n = Int(readLine()!)!

func generateBackground(_ n : Int) -> String {
    if n < 1 {
        return ""
    } 
    return String(repeating: "*", count: n)
}

func generateSpace(_ n : Int) -> String {
    if n < 1 {
        return ""
    }
    return String(repeating: " ", count: n)
}

func solution(_ n : Int) -> String {
    return (0...n - 1).map{
        let backgroundLen = n - $0
        let spaceLen = $0 * 2
        return generateBackground(backgroundLen) + generateSpace(spaceLen) + generateBackground(backgroundLen)
    }.joined(separator: "\n")
}

let answer = solution(n)

print(answer)