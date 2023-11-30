import Foundation

let n = Int(readLine()!)!

func toStrArr(_ arr: [Int]) -> [String] {
    return arr.map{String($0)}
}

func solution(_ n : Int) -> String {
    var i = 1
    var arr = [Int]()
    while i <= n {
        arr.append(i)
        i = i + 1
    }
    return toStrArr(arr).joined(separator: " ")
}

print(solution(n))